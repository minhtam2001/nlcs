<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
class LoginController extends Controller

{
    public function getLogin(){
        return view(('backend.login'));
    }
    public function postLogin(Request $Request){
        $this->validate($Request, [
            'user' => 'required|email:filter',
            'pass' => 'required'
        ]);
        if (Auth::attempt(['email' => $Request->user, 'password' => $Request->pass,'role' => '1'])) {
            return redirect()->route('user');
        }
        Session::flash('error', 'Email và mật khẩu không đúng!');
            return redirect()->back();
    }
    public function logout(){
        Auth::logout();
        return redirect()->route('admin.login');
    }

   
}
