<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index(){
         $products = DB::table('products')->paginate(8);
        return view ('fontend.home',compact('products'));
    }
    public function getDetails($id){
        $products = Product::find($id);
        $details = Product::find($id)->productDetail;
        return view('fontend.details',compact('products','details'));
    }
    public function getCategory($id){
        $products = Product::where('category_id',$id)->get();
        $category = Category::find($id);
        return view('fontend.category',compact('products','category'));
    }
    public function getSearch(Request $request){  
        $products = Product::where('product_name','like','%'.$request->key.'%')
                                ->orWhere('product_price',$request->key)
                                ->get();
        $search = $request->key;
        return view('fontend.search',compact('products','search'));
    }
      
}