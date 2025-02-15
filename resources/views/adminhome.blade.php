<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Movie Ticket Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* Custom header styling to match user homepage */
        .admin-header {
            background-color: #007bff; /* Change to your desired color */
            color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<!-- Header Section -->
<div class="container my-4 admin-header">
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="mb-0">Movie Ticket Booking</h2>
        <div>
            <span>Welcome, <b>{{ auth()->guard('admins')->user()->name ?? 'Admin' }}</b></span>
            <a href="{{ route('admin.logout') }}" class="btn btn-danger ms-3">Logout</a>
        </div>
    </div>
</div>

<!-- Filter Form -->
<div class="container">
    <form method="GET" action="{{ route('admin.home') }}" class="mb-3">
        <div class="row">
            <div class="col-md-3">
                <label for="showtime" class="form-label">Showtime</label>
                <select id="showtime" name="showtime" class="form-select">
                    <option value="">All</option>
                    <option value="11:00 AM" {{ request('showtime') == '11:00 AM' ? 'selected' : '' }}>11:00 AM</option>
                    <option value="2:00 PM" {{ request('showtime') == '2:00 PM' ? 'selected' : '' }}>2:00 PM</option>
                    <option value="6:00 PM" {{ request('showtime') == '6:00 PM' ? 'selected' : '' }}>6:00 PM</option>
                    <option value="9:00 PM" {{ request('showtime') == '9:00 PM' ? 'selected' : '' }}>9:00 PM</option>
                </select>
            </div>

            <div class="col-md-3">
                <label for="showdate" class="form-label">Show Date</label>
                <input type="date" id="showdate" name="showdate" class="form-control" value="{{ request('showdate') }}">
            </div>

            <div class="col-md-2 d-flex align-items-end">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </div>
    </form>
</div>

<!-- Users Table Section (Only displayed if there are bookings) -->
<div class="container">
    @if($users->isEmpty())
        <p class="text-center">No data found</p>
    @else
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Username</th>
                    <th>Ticket Booked Count</th>
                    <th>Seat Numbers</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($users as $index => $user)
                    <tr>
                        <td>{{ $users->firstItem() + $index }}</td>
                        <td>{{ $user->name }}</td>
                        <td>{{ $user->ticket_booked_count }}</td>
                        <td>{{ $user->seat_numbers }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <!-- Pagination -->
        {{ $users->links() }}
    @endif
</div>

</body>
</html>
