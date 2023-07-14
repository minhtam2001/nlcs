<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {   
        $categories = Category::all();
        return view('backend.addproduct',compact('categories')); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $image = $request->file('img');
        $new_name = rand().'.'.$image->getClientOriginalExtension();
        $image->move(public_path('frontend/img/product'), $new_name);
        $store = Product::create([
            'product_name'=>$request->name,
            'product_desc'=>$request->desc,
            'product_image'=>$new_name,
            'product_price'=>$request->price,
            'qty'=>$request->qty,
            'category_id'=>$request->cate,
        ]);
        return redirect()->route('admin');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categories = Category::all();
        $product = Product::find($id);
        return view('backend.editproduct',compact('categories','product'));
         
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {   
        $image = $request->file('img');
        if ($image) {
            $new_name = rand().'.'.$image->getClientOriginalExtension();
            $image->move(public_path('frontend/img/product'), $new_name);
            $old_img = Product::find($id)->product_image;
            $destinationPath = public_path('frontend/img/product/').$old_img;
            if(file_exists($destinationPath)){
            unlink($destinationPath);}
             $update = Product::find($id)->update([
            'product_name'=>$request->name,
            'product_desc'=>$request->desc,
            'product_image'=>$new_name,
            'product_price'=>$request->price,
            'qty'=>$request->qty,
            'category_id'=>$request->cate,
        ]);
        } else {
            $update = Product::find($id)->update([
            'product_name'=>$request->name,
            'product_desc'=>$request->desc,
            'product_price'=>$request->price,
            'qty'=>$request->qty,
            'category_id'=>$request->cate,
        ]);
        }
        
        
        
        return redirect()->route('admin');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       $product = Product::find($id);
        $delete = $product->delete();
        $destinationPath = public_path('frontend/img/product/').$product->product_image;
        if(file_exists($destinationPath)){
            unlink($destinationPath);
        }
        return redirect() ->route('admin');
    }
}
