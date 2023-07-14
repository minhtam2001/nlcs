<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\User;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class CheckoutController extends Controller
{
    public function checkout (Request $request){
        $order = new Order();
        $order->users_id=Auth::id();
        $order->address=$request->add;
        $order->phone=$request->phone;
        $order->order_total=Cart::total(0,'','');
        $order->order_status=0;
        $order->save();

        $carts = Cart::content();
        foreach($carts as $cart){
            $detail= new OrderDetail();
            $detail->order_id=$order->order_id;
            $detail->product_id=$cart->id;
            $detail->product_price=$cart->price;
            $detail->product_qty=$cart->qty;
            $detail->save();
        }

        Cart::destroy();
        return view('fontend.complete');
       
    }
      public function getProfile(){
        $id = Auth::id();
        $user=User::find($id);
        $orders=Order::where('users_id',$id)->get();
        return view('fontend.profile',compact('user','orders'));
    }
    public function orderdetail($id){
        $details = DB::table('order_details')->join('products','order_details.product_id','=','products.product_id')->where('order_id',$id)->get();
        $total = 0;
        foreach($details as $detail){
            $total += ($detail->product_price * $detail->product_qty);
        }
        return view('fontend.orderdetail',compact('details','total'));
    }
    
}
