# Movie Ticket Booking System

## Overview

This is a simple **Movie Ticket Booking System** built using **Laravel 11, jQuery, AJAX, and Bootstrap**. It allows users to **register, log in, and book movie tickets**, while the admin can **view booking details**.

## Features

-   **User Registration & Login**
-   **Movie Listing & Seat Selection**
-   **Booking Management**
-   **Admin Panel to View Booking Details**
-   **Secure Authentication**

## Installation Guide

### Prerequisites

Ensure you have the following installed on your system:

-   PHP 8.1+
-   Composer
-   MySQL / MariaDB
-   Laravel 11
-   Node.js & NPM (for assets compilation, if needed)

### Setup Instructions (Localhost Installation)

1. **Clone the repository:**
    ```sh
    git clone https://github.com/anasmelila/booking.git
    cd booking-app
    ```
2. **Install dependencies:**
    ```sh
    composer install
    npm install
    ```
3. **Configure environment file:**

    ```sh
    cp .env.example .env
    ```

    - Update `.env` with your database credentials.

4. **Generate application key:**

    ```sh
    php artisan key:generate
    ```

5. **Run database migrations:**

    ```sh
    php artisan migrate
    ```

6. **Seed the database with default admin panel details:**

    ```sh
    php artisan db:seed
    ```

7. **Start the development server:**
    ```sh
    php artisan serve
    ```

## Admin Panel

-   **URL:** `/admin/login`
-   **Default Admin Credentials:**
    -   **Email:** `admin@gmail.com`
    -   **Password:** `admin@123`
