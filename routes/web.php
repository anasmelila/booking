<?php

use App\Http\Controllers\LoginController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Route;



Route::get('/', [LoginController::class, 'showRegistrationForm'])->name('register');
Route::post('registeruser', [LoginController::class, 'registeruser'])->name('registeruser');
Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('do-login', [LoginController::class, 'doLogin'])->name('do.login');
Route::post('admin-do-login', [AdminController::class, 'admindoLogin'])->name('admin.do.login');
Route::middleware(['auth'])->group(function () {
    Route::post('book-seats', [BookingController::class, 'bookSeats']);
    Route::get('get-bookings', [BookingController::class, 'getBookings']);
    Route::get('home', [LoginController::class, 'homepage'])->name('home');
    Route::post('logout', [LoginController::class, 'logout'])->name('logout');

});

Route::get('admin/login', [AdminController::class, 'adminlogin'])->name('adminlogin');
Route::middleware(['auth:admins'])->group(function () {
    Route::get('admin/home', [AdminController::class, 'adminhomepage'])->name('admin.home');
    Route::get('adminlogout', [AdminController::class, 'adminlogout'])->name('admin.logout');

   });
