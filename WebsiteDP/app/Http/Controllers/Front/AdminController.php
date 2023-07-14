<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductDetail;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function admin(){
        $products = Product::all();
        return view('backend.product',compact('products'));
    }
}
