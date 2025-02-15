<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BookingController extends Controller
{
    // Store Booking
    public function bookSeats(Request $request)
    {
        $request->validate([
            'showtime' => 'required|string',
            'date' => 'required|date',
            'num_seats' => 'required|integer|min:1|max:5',
            'seat_numbers' => 'required|array',
            'seat_numbers.*' => 'integer',
        ]);

        $userId = Auth::id();

        // Check if any selected seat is already booked
        $alreadyBooked = Booking::where('showtime', $request->showtime)
            ->where('date', $request->date)
            ->whereIn('seat_number', $request->seat_numbers)
            ->exists();

        if ($alreadyBooked) {
            return response()->json(['status' => 'error', 'message' => 'Some seats are already booked!'], 400);
        }

        // Save new bookings
        foreach ($request->seat_numbers as $seat) {
            Booking::create([
                'user_id' => $userId,
                'showtime' => $request->showtime,
                'date' => $request->date,
                'seat_number' => $seat,
            ]);
        }

        return response()->json(['status' => 'success', 'message' => 'Booking confirmed!']);
    }

    // Fetch Bookings
    public function getBookings(Request $request)
    {
        $bookings = Booking::where('showtime', $request->showtime)
            ->where('date', $request->date)
            ->get();

        return response()->json($bookings);
    }
}
