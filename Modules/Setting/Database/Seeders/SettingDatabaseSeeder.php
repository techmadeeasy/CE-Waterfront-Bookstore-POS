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
            'company_phone' => '+27 21 447 2004',
            'notification_email' => 'jerry@cect.co.za',
            'default_currency_id' => 1,
            'default_currency_position' => 'prefix',
            'footer_text' => 'Christ Embassy Waterfront POS © ' . date('Y') . '|| Developed by <strong><a target="_blank" href="https://jerryboy.co.za">Jerry Boy</a></strong>',
            'company_address' => '3 Dock Rd, Waterfront, Cape Town'
        ]);
    }
}
