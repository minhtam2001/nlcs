<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProductDetail;
use Illuminate\Http\Request;

class ProductDetailController extends Controller
{
    public function index($id){
        $details = ProductDetail::where('product_id',$id)->get();
        return view('backend.product_detail',compact('details'));
    }
    public function delete($id){
        ProductDetail::find($id)->delete();
        return back();
    }
    public function edit($id){
        $detail = ProductDetail::find($id);
        return view('backend.edit_product_detail',compact('detail'));
    }
    public function update($id, Request $request){
        $detail = ProductDetail::find($id);
        $detail->update([
            'category_name'=>$request->name,
            'product_desc'=>$request->desc,
        ]);
        return redirect()->route('detail.index',['id'=>$detail->product_id]);
    }

    public function add($id){
            // dd($id);
        return view('backend.add_product_detail',compact('id'));
    }
    public function store($id, Request $request){
        $create = ProductDetail::create([
            'product_id'=>$id,
            'category_name'=>$request->name,
            'product_desc'=>$request->desc,
        ]);
        return redirect()->route('detail.index',['id'=>$id]);
    }
}
