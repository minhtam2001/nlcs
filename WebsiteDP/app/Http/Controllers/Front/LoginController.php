<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
     public function getLogin(){
        return view(('fontend.login'));
    }
    public function postLogin(Request $Request){
        $this->validate($Request, [
            'user' => 'required|email:filter',
            'pass' => 'required'
        ]);
        if (Auth::attempt(['email' => $Request->user, 'password' => $Request->pass,'role' => '0'])) {
            return redirect()->route('home');
        }
        Session::flash('error', 'Email và mật khẩu không đúng!');
            return redirect()->back();
    }
    public function getLogout(){
        Auth::logout();
        return back();
    }
    public function postRegister(Request $Request){
        $this->validate($Request,[
            'name'=>'required',
            'mail'=>'unique:users,email|required',
            'pass'=>'required',
            'phone'=>'unique:users,phone|required'
        ]);
        $user = new User();
        $user->name = $Request->name;
        $user->email = $Request->mail;
        $user->password = Hash::make($Request->pass);
        $user->phone = $Request->phone;
        $save = $user ->save();
        if($save){
            Session::flash('success','Bạn đã đăng ký thành công!');
                return redirect()->route('login');
        }
        else{
            Session::flash('fail','Đăng ký thất bại!');
            return redirect()->route('login');
        }
        
        
    }
}

