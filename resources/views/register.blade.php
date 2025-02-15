<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h3>Movie Ticket Booking</h3>
        <div>

            <a href="{{ route('login') }}" class="btn btn-secondary">Login</a>
        </div>
    </div>

    <!-- Registration Form -->
    <div class="container form-container">
        <h4 class="text-center mb-4">User Registration</h4>

        <!-- Form to Register -->
        <form method="post" action="{{route('registeruser')}}">
            @csrf

            <!-- Name Field -->
            <div class="form-group">
                <label for="name" class="form-label ">Full Name</label>
                <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" required>
            </div>

            <!-- Email Field -->
            <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" required>
            </div>

            <!-- Password Field -->
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" required>
            </div>

            <!-- Submit Button -->
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary w-100">Register</button>
            </div>

        </form>

        <div class="text-center mt-3">
            <p>Already have an account? <a href="{{ route('login') }}">Login here</a></p>
        </div>
    </div>

</body>
</html>
