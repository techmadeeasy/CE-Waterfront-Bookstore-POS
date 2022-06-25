<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => 'auth'], function () {

    Route::post('customers/quick-store', 'CustomersController@quickStore')->name('customers.quick-store');
    //Customers
    Route::resource('customers', 'CustomersController');

    //Suppliers
    Route::resource('suppliers', 'SuppliersController');

});
