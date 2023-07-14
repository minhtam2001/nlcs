<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function admin(){
        $products = DB::table('products')->paginate(6);
        return view('backend.product',compact('products'));
    }
    public function user(){
        $users = User::all();
    return view('backend.user',compact('users'));
    }
    
}
