<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
     public function add($id){
        $products = Product::find($id);
      Cart::add([
        'id'=>$id,
        'name'=>$products->product_name,
        'qty'=>1,
        'price'=>$products->product_price,
        'weight'=>0,
        'options'=>[
            'imges'=>$products->product_image,
        ],
      ]);
      return redirect()->route('cart');
    }
     public function cart(){
         $carts=Cart::content();
         $total=Cart::total();
         $subtotal=Cart::subtotal();
         return view('fontend.cart',compact('carts','total','subtotal'));
     }
     public function delete($rowId){
         Cart::remove($rowId);
         return back();
     }
     public function destroy(){
         Cart::destroy();
         return back();
     }
     public function update(Request $request){
       Cart::update($request->rowId,$request->qty);

     }
}
