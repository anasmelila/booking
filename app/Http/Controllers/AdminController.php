<?php

namespace App\Http\Controllers;


use App\Models\User;
use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller  // Fix the typo here
{
    public function adminlogin()
    {
        return view('adminlogin');
    }

    public function adminlogout()
    {
        auth()->guard('admins')->logout(); // Logout the user
        return redirect()->route('adminlogin'); // Redirect to login page
    }
    // Admin home page
    public function adminhomepage(Request $request)
    {
        // Get sorting and search parameters
        $showtime = $request->input('showtime');
        $showdate = $request->input('showdate');

        // Query for tickets and seats, excluding users with no bookings
        $query = DB::table('users')
            ->leftJoin('bookings', 'users.id', '=', 'bookings.user_id')
            ->select('users.id', 'users.name', DB::raw('COUNT(bookings.id) as ticket_booked_count'), DB::raw('GROUP_CONCAT(bookings.seat_number) as seat_numbers'))
            ->groupBy('users.id', 'users.name')
            ->having('ticket_booked_count', '>', 0); // Exclude users with zero ticket bookings

        // Filter by showtime and showdate if provided
        if ($showtime) {
            $query->where('bookings.showtime', $showtime);
        }

        if ($showdate) {
            $query->where('bookings.date', $showdate);
        }

        // Paginate the results (10 records per page)
        $users = $query->paginate(10);

        return view('adminhome', compact('users', 'showtime', 'showdate'));
    }

    public function admindoLogin()
{
    $input = ['email' => request('email'), 'password' => request('password')];

    if (auth()->guard('admins')->attempt($input)) {
        return redirect()->route('admin.home'); // Change this to 'admin.home'
    } else {
        return redirect()->route('adminlogin')->with('message', 'Login is Invalid');
    }
}
}
