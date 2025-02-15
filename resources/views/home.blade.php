<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background: #343a40;
            color: white;
        }
        .movie-info {
            text-align: center;
            margin-top: 20px;
        }
        .movie-image {
            width: 150px;
            display: block;
            margin: 10px auto;
        }
        .selection-container {
            text-align: center;
            margin: 20px 0;
        }
        .seat-container {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }
        .seat {
            width: 50px;
            height: 50px;
            background-color: #28a745; /* Green - Available */
            color: white;
            text-align: center;
            line-height: 50px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }
        .seat.booked {
            background-color: #dc3545; /* Red - Already booked */
            cursor: not-allowed;
        }
        .seat.my-booking {
            background-color: #007bff; /* Blue - User's booked seats */
        }
        .indicator {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .indicator div {
            display: flex;
            align-items: center;
        }
        .indicator span {
            width: 20px;
            height: 20px;
            display: inline-block;
            margin-right: 5px;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h3>Movie Ticket Booking</h3>
        <div>
            <span>Welcome, <b>{{ auth()->user()->name ?? 'Guest' }}</b></span>
            @if(auth()->check())
                <!-- Logout Form -->
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: inline;">
                    @csrf
                    <button type="submit" class="btn btn-danger">Logout</button>
                </form>
            @else
                <a href="{{ route('login') }}" class="btn btn-secondary">Login</a>
            @endif
        </div>
    </div>

    <!-- Movie Details -->
    <div class="container movie-info">
        <h2>Movie</h2>
        <img src="{{ asset('storage/images/poster.jpg') }}" alt="Movie Image" class="movie-image">
    </div>

    <!-- Showtime, Date, and Number of Seats Selection -->
    <div class="container selection-container">
        <div class="row">
            <!-- Showtime Selection -->
            <div class="col-md-4">
                <label for="showtime" class="form-label"><b>Select Showtime:</b></label>
                <select id="showtime" class="form-select">
                    <option value="11:00 AM">11:00 AM</option>
                    <option value="2:00 PM">2:00 PM</option>
                    <option value="6:00 PM">6:00 PM</option>
                    <option value="9:00 PM">9:00 PM</option>
                </select>
            </div>

            <!-- Date Selection -->
            <div class="col-md-4">
                <label for="show-date" class="form-label"><b>Select Date:</b></label>
                <input type="text" id="show-date" class="form-control text-center" placeholder="Select Date">
            </div>

            <!-- Number of Seats Selection -->
            <div class="col-md-4">
                <label for="num-seats" class="form-label"><b>Select Number of Seats:</b></label>
                <select id="num-seats" class="form-select">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
        </div>
    </div>

    <!-- Seat Indicators -->
    <div class="container indicator">
        <div><span style="background-color: #28a745;"></span> Available</div>
        <div><span style="background-color: #dc3545;"></span> Already Booked</div>
        <div><span style="background-color: #007bff;"></span> My Bookings</div>
    </div>

    <!-- Seat Selection -->
    <div class="container seat-container">
        @for ($i = 1; $i <= 20; $i++)
            <div class="seat" data-seat="{{ $i }}">{{ $i }}</div>
        @endfor
    </div>

    <!-- Confirmation Modal -->
    <div class="modal fade" id="confirmModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Booking</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to book these seats?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button id="confirmBooking" class="btn btn-primary">Confirm</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script>
        $(document).ready(function () {
            let selectedSeats = [];
            let userId = {{ auth()->id() ?? 'null' }}; // Get logged-in user ID
            let showtime, date;

            // Fetch booked seats
            function loadBookedSeats() {
                showtime = $("#showtime").val();
                date = $("#show-date").val();

                if (!date) return;

                $.ajax({
                    url: "/get-bookings",
                    method: "GET",
                    data: { showtime, date },
                    success: function (bookings) {
                        $(".seat").removeClass("booked my-booking selected").css("background-color", "#28a745");

                        bookings.forEach(booking => {
                            let seat = $(".seat[data-seat='" + booking.seat_number + "']");
                            if (booking.user_id == userId) {
                                seat.addClass("my-booking").css("background-color", "#007bff"); // User's booked seat (Blue)
                            } else {
                                seat.addClass("booked").css("background-color", "#dc3545"); // Booked seat (Red)
                            }
                        });
                    }
                });
            }

            // Initialize Date Picker
            flatpickr("#show-date", {
                dateFormat: "Y-m-d",
                minDate: "today",
                onChange: function () {
                    loadBookedSeats();
                }
            });

            $("#showtime").change(loadBookedSeats);

            // Select Seats
            $(".seat").click(function () {
                if ($(this).hasClass("booked")) {
                    alert("This seat is already booked.");
                    return;
                }

                let seatNumber = $(this).data("seat");

                if (selectedSeats.includes(seatNumber)) {
                    selectedSeats = selectedSeats.filter(s => s !== seatNumber);
                    $(this).removeClass("selected").css("background-color", "#28a745"); // Revert to Green
                } else if (selectedSeats.length < $("#num-seats").val()) {
                    selectedSeats.push(seatNumber);
                    $(this).addClass("selected").css("background-color", "#ffff00"); // Change to White
                } else {
                    alert("You can only select up to " + $("#num-seats").val() + " seats.");
                }

                if (selectedSeats.length === parseInt($("#num-seats").val())) {
                    $("#confirmModal").modal("show");
                }
            });

            // Confirm Booking
            $("#confirmBooking").click(function () {
                $.ajax({
                    url: "/book-seats",
                    method: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        showtime: $("#showtime").val(),
                        date: $("#show-date").val(),
                        num_seats: $("#num-seats").val(),
                        seat_numbers: selectedSeats
                    },
                    success: function (response) {
                        alert(response.message);
                        $("#confirmModal").modal("hide");

                        // Change selected seats to blue (My Bookings)
                        selectedSeats.forEach(seatNumber => {
                            $(".seat[data-seat='" + seatNumber + "']").removeClass("selected").addClass("my-booking").css("background-color", "#007bff");
                        });

                        selectedSeats = [];
                    },
                    error: function () {
                        alert("An error occurred. Please try again.");
                    }
                });
            });
        });
    </script>
</body>
</html>
