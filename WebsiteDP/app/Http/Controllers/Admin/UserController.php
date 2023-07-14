<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function create(){
        $users = User::all();
        return view('backend.adduser',compact('users'));
    }
    public function store(Request $request){
        $store = User::create([
            'name'=>$request->name,
            'email'=>$request->email,
            'password'=>Hash::make($request->pass),
            'phone'=>$request->phone,
            'role'=>1,
        ]);
        return redirect()->route('user');
    }
}
