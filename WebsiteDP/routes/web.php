<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Front;
use GuzzleHttp\Middleware;
use Psy\CodeCleaner\FunctionContextPass;
use App\Http\Controllers\Admin;
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

Route::get('/',[Front\HomeController::class,'index'])->name('home');
Route::get('details/{id}',[Front\HomeController::class,'getDetails'])->name('detail');
Route::get('test',function(){
    return \App\Models\Product::find(1)->productDetail;
});
Route::get('category/{id}',[Front\HomeController::class,'getCategory'])->name('category');
Route::get('search',[Front\HomeController::class,'getSearch'])->name('search');
Route::get('login',[Front\LoginController::class,'getLogin'])->name('login');
Route::post('login',[Front\LoginController::class,'postLogin'])->name('sign.in');
Route::get('logout',[Front\LoginController::class,'getLogout'])->name('logout');
Route::post('register',[Front\LoginController::class,'postRegister'])->name('register');


Route::prefix('cart')->group(function(){
    Route::get('/',[Front\CartController::class,'cart'])->name(('cart'));
    Route::get('add/{id}',[Front\CartController::class,'add'])->name('cart.add');
    Route::get('delete/{rowId}',[Front\CartController::class,'delete'])->name('cart.delete');
    Route::get('destroy',[Front\CartController::class,'destroy'])->name('cart.destroy');
    Route::get('update',[Front\CartController::class,'update'])->name('cart.update');
});
Route::post('checkout',[Front\CheckoutController::class,'checkout'])->middleware('auth')->name('checkout');
Route::get('profile', [Front\CheckoutController::class, 'getProfile'])->middleware('auth')->name('profile');
Route::get('orderdetail/{id}',[Front\CheckoutController::class,'orderdetail'])->name('orderdetail');

Route::get('login/admin', [Admin\LoginController::class, 'getLogin'])->name('admin.login');
Route::post('login/admin', [Admin\LoginController::class, 'postLogin'])->name('admin.login.post');
Route::get('logout/admin', [Admin\LoginController::class, 'logout'])->name('admin.logout');

Route::group(['prefix' => 'admin','middleware'=>'auth'], function(){
Route::get('/',[Admin\HomeController::class,'admin'])->name('admin');
Route::resource('product', Admin\ProductController::class);
Route::get('destroy/{product}',[Admin\ProductController::class,'destroy'])->name('destroy');

Route::get('user',[Admin\HomeController::class,'user'])->name('user');
Route::get('create',[Admin\UserController::class,'create'])->name('create');
Route::post('store',[Admin\UserController::class,'store'])->name('create.user');

Route::resource('category', Admin\CategoryController::class);

Route::get('delete/{category}',[Admin\CategoryController::class,'delete'])->name('delete');
Route::get('order',[Admin\OrderController::class,'order'])->name('order');
Route::get('status/{id}',[Admin\OrderController::class,'status'])->name('status');
Route::get('product-detail/{id}',[Admin\ProductDetailController::class,'index'])->name('detail.index');
Route::get('productdetail-edit/{id}',[Admin\ProductDetailController::class,'edit'])->name('detail.edit');
Route::post('productdetail-update/{id}',[Admin\ProductDetailController::class,'update'])->name('detail.update');
Route::get('productdetail-delete/{id}',[Admin\ProductDetailController::class,'delete'])->name('detail.delete');
Route::get('productdetail-add/{id}',[Admin\ProductDetailController::class,'add'])->name('detail.add');
Route::post('productdetail-store/{id}',[Admin\ProductDetailController::class,'store'])->name('detail.store');

});
