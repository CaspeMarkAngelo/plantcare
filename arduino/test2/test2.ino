#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <DHT.h>
#include <ArduinoJson.h>
#include <WiFiClientSecure.h>

// WiFi credentials
const char* ssid = "HUAWEI-2.4G-YxM6";
const char* pass = "Nb2suby6";

// DHT11 sensor setup
DHT dht(D4, DHT11);

// Pin definitions
#define soil A0         
#define PIR D5          
#define RELAY_PIN_1 D1   
int relay1State = LOW;

// Server URL for fetching control data
String serverUrl = "http://192.168.100.33/capstone(test)/"; 
String sendDataUrl = serverUrl + "update-sensor-data.php";
String getControlUrl = serverUrl + "get-control-data.php";
String updateRelayStateUrl = serverUrl + "update-relay-state.php";

// Device name
String deviceName = "device1";  

WiFiClient wifiClient;

// Declare last sensor values
float lastTemperature = -1.0;
float lastHumidity = -1.0;
int lastSoilMoisture = -1;
bool lastPirState = false;

unsigned long wateringStartTime = 0;
bool wateringInProgress = true;
int initialSoilMoisture = 0;

// Function declarations
void logWateringActivity(int soilMoisture, String relayState, String remarks);
void sendNotification(String message);

void setup() {
  Serial.begin(9600);

  // WiFi connection
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");

  // Initialize sensors and relay
  dht.begin();
  pinMode(soil, INPUT);
  pinMode(PIR, INPUT);
  pinMode(RELAY_PIN_1, OUTPUT);
  digitalWrite(RELAY_PIN_1, LOW);
}

void loop() {
  // Read sensor data
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  int soilMoisture = analogRead(soil);
  soilMoisture = map(soilMoisture, 0, 1024, 0, 100);
  soilMoisture = (soilMoisture - 100) * -1;
  bool pirState = digitalRead(PIR);

  // Fetch control data and adjust relay state based on moisture level


  // Check for watering failure after relay is ON for 10 seconds
  if (wateringInProgress && (millis() - wateringStartTime >= 1500)) {
    if (soilMoisture <= initialSoilMoisture) {
      // Soil moisture hasn't increased, log the activity and turn off the relay
      logWateringActivity(soilMoisture, "OFF", "Not watering - soil moisture didn't increase");
      digitalWrite(RELAY_PIN_1, HIGH);  // Turn off the relay
      updateRelayStateOnServer("RELAY_OFF");
      sendNotification("Watering failed. Soil moisture didn't increase.");
      wateringInProgress = false;
    }
  }

  // Send sensor data to server if it has changed
  if (hasDataChanged(t, h, soilMoisture, pirState)) {
    sendDataToServer(t, h, soilMoisture, pirState);
  }
  getControlDataFromServer(soilMoisture);
  sendHeartbeatToServer();
  delay(1000);  // Check every 1 second for changes
}

bool hasDataChanged(float temperature, float humidity, int soilMoisture, bool pirState) {
  if (temperature != lastTemperature || humidity != lastHumidity || soilMoisture != lastSoilMoisture || pirState != lastPirState) {
    lastTemperature = temperature;
    lastHumidity = humidity;
    lastSoilMoisture = soilMoisture;
    lastPirState = pirState;
    return true;
  }
  return false;
}

void sendDataToServer(float temperature, float humidity, int soilMoisture, bool pirState) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    http.begin(wifiClient, sendDataUrl);
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");

    String postData = "temperature=" + String(temperature) +
                      "&humidity=" + String(humidity) +
                      "&soilMoisture=" + String(soilMoisture) +
                      "&pirState=" + String(pirState) +
                      "&device_name=" + deviceName;

    int httpResponseCode = http.POST(postData);
    Serial.println(httpResponseCode > 0 ? http.getString() : "Error sending data");
    http.end();
  }
}

void updateRelayStateOnServer(String state) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    http.begin(wifiClient, updateRelayStateUrl);
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");
    String postData = "device_name=" + deviceName + "&relay_state=" + state;
    int httpResponseCode = http.POST(postData);
    Serial.println(httpResponseCode > 0 ? "Relay state updated on server" : "Failed to update relay state on server");
    http.end();
  }
}

void getControlDataFromServer(int soilMoisture) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    http.begin(wifiClient, getControlUrl + "?device_name=" + deviceName);
    int httpResponseCode = http.GET();

    if (httpResponseCode > 0) {
      String response = http.getString();
      Serial.println("Control response: " + response);
      StaticJsonDocument<200> doc;
      if (deserializeJson(doc, response)) {
        Serial.println("JSON Parsing Error");
        return;
      }
      int targetMoisture = doc["moisture_level"].as<int>();
      String relayCommand = doc["relay_state"];
      if (soilMoisture <= targetMoisture && relayCommand == "RELAY_ON") {
        digitalWrite(RELAY_PIN_1, LOW); // Relay ON
        wateringStartTime = millis();  // Start the timer for watering check
        initialSoilMoisture = soilMoisture; // Store the initial soil moisture
        wateringInProgress = true;
        Serial.println("Turning relay ON");
        logWateringActivity(soilMoisture, "ON", "Automatic watering started");
        sendNotification("Soil is dry. Watering started.");
      } else if (soilMoisture >= targetMoisture && relayCommand == "RELAY_ON") {
        digitalWrite(RELAY_PIN_1, HIGH); // Relay OFF
        wateringInProgress = false;
        Serial.println("Turning relay OFF");
        logWateringActivity(soilMoisture, "OFF", "Automatic watering stopped");
        updateRelayStateOnServer("RELAY_OFF");
        sendNotification("Soil is wet. Watering stopped.");
      }
    } else {
      Serial.println("Error receiving control data: " + String(httpResponseCode));
    }
    http.end();
  }
}

void sendHeartbeatToServer() {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    http.begin(wifiClient, serverUrl + "fetch_device_status.php");
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");
    String postData = "device_name=" + deviceName;
    int httpResponseCode = http.POST(postData);
    Serial.println(httpResponseCode > 0 ? "Heartbeat sent successfully" : "Failed to send heartbeat");
    http.end();
  }
}

void logWateringActivity(int soilMoisture, String relayState, String remarks) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    http.begin(wifiClient, serverUrl + "log_watering.php");
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");

    String postData = "device_name=" + deviceName +
                      "&soil_moisture=" + String(soilMoisture) +
                      "&relay_state=" + relayState +
                      "&remarks=" + remarks;

    int httpResponseCode = http.POST(postData);
    if (httpResponseCode > 0) {
      Serial.println("Watering log sent successfully: " + http.getString());
    } else {
      Serial.println("Failed to log watering activity. Error code: " + String(httpResponseCode));
    }
    http.end();
  } else {
    Serial.println("WiFi not connected, unable to log watering activity.");
  }
}

void sendNotification(String message) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;
    http.begin(wifiClient, serverUrl + "send_notifcation.php");  // Replace with the actual notification endpoint
    http.addHeader("Content-Type", "application/x-www-form-urlencoded");

    String postData = "device_name=" + deviceName + "&message=" + message;

    int httpResponseCode = http.POST(postData);
    if (httpResponseCode > 0) {
      Serial.println("Notification sent: " + message);
    } else {
      Serial.println("Failed to send notification. Error code: " + String(httpResponseCode));
    }
    http.end();
  }
}
