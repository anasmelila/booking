-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 06:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `show_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_seats`
--

CREATE TABLE `booking_seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `seat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_30_153044_create_movies_table', 1),
(5, '2025_01_30_153204_create_shows_table', 1),
(6, '2025_01_30_153258_create_seats_table', 1),
(7, '2025_01_30_153352_create_bookings_table', 1),
(8, '2025_01_30_153446_create_booking_seats_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seat_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0bMGjj5EwtdlHzGTTACuvwNIkBKt0luOZXR8sLBz', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTJpR1lISldzSkZWUUhmODFLMHhtWWVMRmphRlduT3JTNWh0UkVSWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738291322),
('11FehGiZZlu7yUQ9EdQkjtHfjb0hWAr0XmIUTPzE', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHY1c3FnVEpVWGJ6TGtTRmVJT0xlV3RhRmhhRE1aUkJQajhKV1RWTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289283),
('1RFAimLLgYv2hXuBl6yRlnGvBIXZf8IebI9nlQ5Q', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmp2dXBzeFk1eDZSaWpEdXNzcEwzNTdKZENlNHpOaWRFMEF1OVhoNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254623),
('2gjrkPAGJrDP7oCuH4mrH4oV8bSB3sWzpVLDqrxC', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ09Ra1pnUlY2OUY4Q29tY3k0TEpkU1Q0OTJQa2lnZ0w5Unp5YWdtOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254393),
('2gVknTdpXnevk5YUo2ZPDyWKGJcBDqwWJOmTDK6r', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjBFV3dkZk1aVUJkZXdHOGlGa1Z1Y2RIczN5RlVEYnBHak1wbHVneiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289253),
('3z6do5eFRX4f9aEMnBK3VTA47tFxW5bjmVh7GVqq', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzFkdWxIS0k2eG1uZk0yUEhCQ2lSTjF6YndpMzhFcW1CTGljS0ZRdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289326),
('4bLG4JlUIzQce5ZOMKj0d6xvGf7zMFIA3D1OSj1p', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkR6Z25MbkpPZVk4MEV0RFFlS2lkZ2RoUTE0RmxpVVFzdlAxSlhUNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256482),
('4JIJZHwRBPTPzeGSvsSxDQvcdLoANV0t6dBfF8up', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGJTQzBmRjhIUFVXd0xyREI4R0l0b2JYbE43RzQ5dk9xVDZZQUJTciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738253831),
('5auA2Mq6P78OC0DR2maQo2lyx2HPSatPmwkzHVSU', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEtHOGhlVnpjbGVSd2JCQllDaDBXR1FHMmE4dVI3RTJHQjN4OXNkdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738253784),
('5j5gaJx5x32Z3yoyNXxTzTManh9RF2Zo9PQHhYy5', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHdCY3drb3dLSlhQZXpqN01JRWRNWk1HSEhDTTI1cmJDNVg5N0tIYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254986),
('71c8vaZR6XopF0b7WCUt8EBfPEmCbueWhpG9mRsL', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWxOZ250VVd2ZVhvQXg0WFVXVEhIMGZuRVFVb0ZybkdtbnlWSHVsdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738290695),
('7oyZRO457WgLp0LkDSPi0iWjbGpsxdOShNZcJYz0', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU5yNVJkRUF4aGEwN3JhbFlzaWE3TXU3V3BPQUQ4YUVHM3E2YkVYMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254640),
('7RiD07kbejoAOrgQ6kGKxU5cDYhGjZ1x0E6WXzQn', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTFjUlptanFISFFySk1xN1RVdWplR05HTXFCTVV1cGtnZVBxTHh5cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254690),
('9dYMv30cU6MGCmwRo98K4pp0829BOlFitWEFadbv', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHFEamhXd2cwZVA1eVpWQ3VOM1M1YVBVU25RV09oTldsc1JYVzNhdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254505),
('BGeK2mwHgJ9GRPoazqP0tf6LVm8h4rWOyFnU5YXL', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWlrNGt3VjFPMDRVUVpkR2pyNFRVQUVuREpWcGRtUjlUc3A0OGZ2cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289290),
('BHyyRv9a1moBGoMnVgJgT4MIgfLdZ2jg1uPgl9qq', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGNpbnUyaHBwQjlJYktJRzV3bkQwTGQydFV1N2JTVWJSaHhSWFdpdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254889),
('cbPMuqFMo8HNuFsMkNlflrBy46B1mofYm09yzXpB', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmphbGVUYncyVDVKV05XWHFEVXY0STBWMGx0alNvWGtVZUhwc3E2VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289405),
('CpnPHdcw3dL80jlzC3erh5kZQAftKl3pqg8r7gG4', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzNxU3ZsTEZ4NkZNampiSkJaSDBpaGljYkdWZHI5blJCTDhnWHhqdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289269),
('dBR7Qvyr7RV2Z050aGpy7vxAnoBB5QTrbRz8xSNo', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0RaaERveGdGV3cxYVY0bFVTNEFabG85RG9MUTl1OFl6QXR5cWVwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289773),
('dkMF40pLfB7PGVsjSgvgdswsgNkIJW4tfeNKNojL', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjZtbldidVJvZE0yeGsxVmk4eDFmYmdhWHBKbEs3R29vdDdkZGpKciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256348),
('DUTyIBwyyduLjcnalVYNEwxs2Rmp8OqWFwJ4bDud', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjRLdEhDT1V4cGhNZXZwQTF1MHZiNFpNT3RwMzRJb3c4Z0NPVENvcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738290701),
('E3FiWu6PCBtLorxYh4I29Ep7N841AonvJjtYsYaf', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFd4MXFkZFRMeWhCdVgySTUwSzBTUUhFM25na2EyVUpSSWlBVGFyUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289690),
('e7s1U7j2JRZL4qxdL2Ga4jsZ1kl3YzMA9xCp8x6o', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2M5N2FuSDdxYVljOTNaelJZV0ZLWUtBMENzUUNZV1I4VmVBb0I4RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738256930),
('eDZmK9bDRBvMR9AWy2bNIrbx0eCCQlucGK4utpOp', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGR2T3A0T3gxNWtSdHp6R3ZUVmlBc081b2RrSEJzMk1pa2V3M0ZMTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254836),
('eQw6rbWKPkii5nDrXxLHTW8FL6dcvGqyEljXlrXy', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzVmN3JjcTA4d045d0U3bXhKQkoxZ281TGVvejdCTkN5ZXNCRkJqeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256318),
('FSGcWZvBpCbm0qYCaUcBX3K3ksWgj0V1Ce0yjZKJ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3gwV0s2UTJ5bDFRbW11eUUybkpUMlJmOXc0UGwwUnpwVlRwN0E5SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256427),
('fXDYk6CjzUbQ05dNPUMGh4dUEdT6vCtc1EwmYVku', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUk9jMmxxRFZhTUw0WDQzam5lYnhwaU9rOEltY25pTEVDVEdaNnh1MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738291272),
('gOcNcecEMvhmOfKk0zKj8HTWatV3c4WjIdJDUJBg', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUdmOTlFbEpvWmpTc1RYejE1N1BjNHd5RGdNYWczbjB6cERUWFl1YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289519),
('GrhePLGGj5uOpfwXDKKV3rNhp1Nyy5WzDtvdEdh0', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHVweFZ1d205eUxrZThDRFFXalNGOW92NTZUeVk1akRVTUE4ajRJZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738290604),
('gTapV2OtUEM3vxjoO0AX2Y5u1AsXZA4X8hqD3QTR', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEZHS0RzR1pBY1FmQmljYzJxang5SVVvZWRpbjZ4cWlPbTlTNFUxUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254277),
('GUGNIqlI2C5i1xyuF7cJRdiY290tosj1nrELkF9U', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclFibFlZQVJ6V1d5ZnlNTEpPRzhndXRoUEM3UjFneG1GOWREdllseSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738255039),
('gyREv3opjpht0JVUOSJFKXvTlp9YojAgD4HCankA', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0dQZXFyNGxGMmxaV3VETm52UkJ2MTF4NVViQkpBSDNRV1phZUVlayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738290601),
('iLs8BntAlkWQsOweYF6N8tEEiYj7bg3Niq2M9ZzC', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2N4dzV1aFd4MHA5R3FEakx6S1lsamRJTnNSb1lOOWNtaFJLQnFjbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254268),
('ITFuyI98f3co4jZs69iyECO1AEbbBLnXdtgbBAtK', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0g4eFZEczd4WlJWMEt4Vk1lWlZ2RFI5bnB0RkpnUUZTaHAwT3RiOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738253106),
('IuwFC7B6jcXwWGgYyHVNB57KtX8T1MIJxqeryzlt', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUQzZWs0YnYyZmNldmJnOU1IcU5vcUV0cjFPMHNIWHI5TWJYSFFNTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289485),
('jILh91TcWxH50tNuwwMPNXqnPxhJd1VL5w2cMlbp', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWNFeTRKc3V3UGFjd1pvWkxLWGZKSDVWSTJHaWZFMlM4ZTNuVnR6UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738290668),
('JTcQRDMGpP24bC9Ig1oa7tpsWyllGmksENe3fQvK', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWozZVlkdU90QlZHbUE3dldZSXFDQmRzV2J1TEk5THlKRTQyM042TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738253809),
('KGTosliTpDGrFojPpFiKSFbUj6JVqh4f8uVJFcsh', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDJzZDdNdEhLMlJFMjJZZDhtY0tMVWxhblgzSHFhWURzVWlUTjBiTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254880),
('kqDJ8vA7KpStNAWBQg1jvjJbw0KOH649eVGGlbfj', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjZ1a3JlSHB4YWFOa2RkM3RMUGhCd0xlVm5CWU9vNkFabVVObU9rWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256067),
('kTm55C494LT4ibpARThW9gFZMRJfCJzjT0w5McZF', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXR6Z0Roa0hQTnVmY2RWVkI0RGFGVDhtT2czYnQ5TjE5cTVyY1RIdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256845),
('l618CYaJE7loVsNPUIsUgMkpXk6wf2zTQ3jJzrYI', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamFuNEZENFc2cENVMjlpTE5WZFJKbmtydWJtWXhPMlRTRDJkdzlZcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256863),
('lodXaOrLhUwUYs4C1B3JmqsbE0tiT7e2SMtyiUvP', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU9hSGlxMnJOSjExVlI3SVJDbWU4ck9pVmduWG9icWhwY0ZUTTRiOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256532),
('lOXoeQG2AfFFe5EQGvCzNaBSGsOKvNP8NAwqH37K', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQm9WeGdCelJrelJscllsNk1nQXhRYUd3UnU5eFFuY0dLclZRWmZ1SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738255232),
('m95CvjoE2FvxOysP0Tc6nlgyVYfNncaZv8kZgSEQ', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEpXbHdKZmg5R2NGQmtUVHFNaTIwdklMNWdORFhzNGpmdksweE55dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254635),
('N66q8pAdSn1Jx8JgH6GiNNym5AcolW87VHOYa1aX', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHQwVVc4VlFUSTByWXRVcEpQWXh4R21Vb2NMa1ZvQndDMklVY0R5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256174),
('p4zGoxjYk8THWYArPRf52B7wyY9RPs3wWapzTbNE', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTBhcjN4TXpqOGhZZWpVWXl1bTRFVnBuOFIxRWtja0pwTlc4TXBRaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254800),
('Pxzmp0ZActhUV3SPhtNltNm3fXXawUXkHoXb0K5j', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0s0TFJia1JSOFEyUkpWUVd5N1Z0a0VrSTMydVBjZFI2ZHZHeEx1aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738252683),
('qsrXoGC8iUtz5XuCZ1OT0YbA6UhA3tXcrVfSZwpx', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVo2bkx5Z3c0aFVSMHpjV004ME50eTlIbWdPckVkN3RwOXVlTXlkMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289687),
('SinEVgW3kHzflxc5WArntROHhiEsUN5x5i8oqg4U', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT2JFUk1Nd2lkVU9kalQxVUdmekNRUm9DNEZIOHhRRVdmSlJwR3lFWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob21lIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1738291273),
('SXq1dV550wQVC0NAaGylDJeGTtt62igarW4u7tey', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3Y3OVNuV0VhcnNMd3Zpb0pjOTI1eGdtVEJjWGhqQmhRelhTRW1ibiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256309),
('Tq024GRMXUVw7R0fuc0B7xKuraIz8aPDanQkbGdH', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHNHTHNvTzJQbFlZQnAzUEg4Q2NVT2RIMmZkM2pMVU5xamtjMnJyNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256089),
('tVsm5n9k9I5adnrex3kNTiicAs54KlDn1i6mEh6s', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWh3MVVHS1pjdE1HcjNJNjgyZXhtbXZ1djRsVUZQZ0pJdzM4WVY5VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256257),
('tYedtwvX9Lj3uDd6eQc8iLiDB5uiNScmoNKkWSiV', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUJqRWt0RzNHeHYzR2t1T3VSOGs3MExka2dTUWwwQXNvN2hmMVlEUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289070),
('umz3NwCa7jU372YggNsdpfN0lrBpsfutQIW4KJ2T', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEs1dXA1ZUlVanF5cTV0ZzBxNE5tOXE3SDVCRE52QjdSQVJFb0w5UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289647),
('UvX67IVmVixckrbiEa6Kf7j72bMRPMLzmdwVrsmg', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVRYbnFiQ0lkd0NEeFAzdkZ1eDdzTXlhYTVQWEFocnFDOXJOWHJ4VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254864),
('uYHDooDW6yapv3jX3dkVi8N3KzWI31VXC68hGFlF', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1Bhck1lcWd5blp2ank5WFNCdUVBTW9ibmxvRnBwcHVjY2FCMzJIWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254483),
('VdrGtz59vLkcSx7w00fvSBrIDTpr83JOsvxBI17f', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzJ1aGs2RVFMYk1KbEloc3pOYURxVFFxUXVaeVNyc3dScWhEZjAzSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289468),
('vXgVgw5e3E9k3RTlqbtUfxWsyUx4faOJK7z4Vdu6', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam5scndhQ1NUWHRTOVVtRnRlTUYyUEM4VnBDWGxSbFFtNlo4UnZZVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738289653),
('wrQXXz9QTtU85ofkW66WIjoOJE8Bc22lFudZZcfW', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlE4Z1VYN2hNZmJCQmtUZ0NnbXZ5bE9uQlJEbmFOTTZvTHdDZEtHbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254355),
('xSdBguCLbo0eKjlYN1GbBMw2hQ322c8Ferb3pE3l', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEk0cDVYYWtLakM1UG1kbkJVeExCUWVUUm5VbzNYaEx4TWRXZHJpbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738256853),
('ZHOTnhLR7N8u784uXguK5TrDpuuP5Vcr6ztbmSio', NULL, NULL, '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkhVQ0JtZUZ3dFBVMHhhZ3VIUFltY3dHRXgwU3YxRWhNMEJPd241YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODoiaHR0cDovLzoiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1738254140);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `show_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'anas', 'anas@gmail.com', '$2y$12$yEQfSDB2Up/3dhMwH65MhuwGnzcA234WNPrptGEvNKw8VyoN6A9q.', '2025-01-30 11:29:22', '2025-01-30 11:29:22'),
(2, 'manu', 'manu@gmail.com', '$2y$12$FuGjnC00wZmxaQsNbiD1POrXkPHFq9ILlGh9RlzRYEdGnH9N3qiVW', '2025-01-30 20:39:11', '2025-01-30 20:39:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_show_id_foreign` (`show_id`);

--
-- Indexes for table `booking_seats`
--
ALTER TABLE `booking_seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_seats_booking_id_foreign` (`booking_id`),
  ADD KEY `booking_seats_seat_id_foreign` (`seat_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shows_movie_id_foreign` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_seats`
--
ALTER TABLE `booking_seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_show_id_foreign` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_seats`
--
ALTER TABLE `booking_seats`
  ADD CONSTRAINT `booking_seats_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_seats_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
