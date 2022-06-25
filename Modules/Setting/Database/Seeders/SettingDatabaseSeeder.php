<?php

namespace Modules\Setting\Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use Modules\Setting\Entities\Setting;

class SettingDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Setting::create([
            'company_name' => 'CECT Books POS',
            'company_email' => 'info@cect.co.za',
            'company_phone' => '0810292775',
            'notification_email' => 'info@venanciogomani.net',
            'default_currency_id' => 1,
            'default_currency_position' => 'prefix',
            'footer_text' => 'Christ Embassy Waterfront POS © 2022 || Developed by <strong><a target="_blank" href="https://venanciogomani.net">Venancio Gomani</a></strong>',
            'company_address' => '3 Dock Rd, Waterfront, Cape Town'
        ]);
    }
}
