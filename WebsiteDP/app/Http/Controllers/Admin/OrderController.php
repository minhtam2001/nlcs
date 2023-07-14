<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function order(){
        $orders = Order::all();
        return view('backend.order',compact('orders'));
    }
    public function status($id){
        $status = Order::find($id)->update([
            'order_status'=>1
           
        ]);
         return redirect()->route('order');
    }
}
