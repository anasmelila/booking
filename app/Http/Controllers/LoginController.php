<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;



class LoginController extends Controller
{
    public function homepage()
    {
        return view('home');
    }

    public function showRegistrationForm()
    {
        return view('register');
    }

    public function registeruser(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:5',
        ]);

        // Create user logic
        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);

        // Redirect to register route

        return redirect()->route('login')->with('message', 'Registration successful! Please login.');
    }


    // Define the showLoginForm method to handle login page display
    public function showLoginForm()
    {
        return view('userlogin'); // Ensure you have the login view in resources/views/login.blade.php
    }

 public function doLogin()
{
    $credentials =[ 'email'=>request('email'),'password'=>request('password')];

    if (Auth::attempt($credentials)) {
        return redirect()->route('home');
    } else {
        return redirect()->route('login')->with('message', 'Login is Invalid');
    }
}
public function logout()
{
    Auth::logout(); // Logout the user
    session()->invalidate(); // Invalidate session
    session()->regenerateToken(); // Regenerate CSRF token

    return redirect()->route('login'); // Redirect to login page
}


}

