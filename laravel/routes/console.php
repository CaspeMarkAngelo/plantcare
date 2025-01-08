<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote')->hourly();

Schedule::call(function () {
    $data = DB::table('watering_time')->whereDate('start_date', now()->toDateString())->first();

    if ($data) {
        // Assuming the PHP endpoint is accessible at this URL, which returns the device_id
        $response = Http::get('http://localhost/capstone(test)/get-device-id');

        if ($response->successful()) {
            $deviceId = $response->json('device_id'); // Adjust key if necessary

            // Insert or update the relay state using the device_id
            DB::table('device_config')->where('device_id', $deviceId)->update([
                'relay_state' => 'RELAY_ON'
            ]);

            // Add a notification to indicate the device has been turned on
            DB::table('notifications')->insert([
                'message' => "Schedule reached"
            ]);

            // Delete the scheduled watering time record if needed
            DB::table('watering_time')->where('id', $data->id)->delete();
        }
    }
})->everyMinute();
