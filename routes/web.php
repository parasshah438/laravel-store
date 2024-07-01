<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StoreFinderController;


Route::get('/', function () {
    return view('welcome');
});

Route::get('stores', [StoreFinderController::class, 'index']);
Route::get('nearest-stores', [StoreFinderController::class, 'getNearestStores']);
Route::get('list', [StoreFinderController::class, 'list']);