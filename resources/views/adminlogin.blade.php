<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Custom width for the login box */
        .login-box {
            max-width: 400px;  /* Reduce the width */
            margin: 0 auto;    /* Center the box */
        }
    </style>
</head>
<body>

    <div class="container mt-5">
        <!-- Registration Page Header -->
        <h2 class="text-center mb-4">Movie Ticket Booking - AdminLogin</h2>

        <!-- Login Form Box with reduced width -->
        <div class="card p-4 login-box">
            <h4 class="text-center mb-4">Login</h4>
            @if(session()->has('message'))
            <p>{!! nl2br(e(session()->get('message'))) !!}</p>
            @endif
            <!-- Login Form -->
            <form action="{{route('admin.do.login')}}" method="post">
                @csrf
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
        </div>
    </div>

</body>
</html>
