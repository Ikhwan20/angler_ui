import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:angler/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:angler/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:angler/features/onboarding/presentation/screens/initial_screen.dart';
import 'package:angler/features/fishing_spots/presentation/screens/spot_list_screen.dart';
import 'package:angler/features/fishing_spots/presentation/screens/spot_detail_screen.dart';

class AppRouter {
  // Route names as constants
  static const String initial = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String fishingSpots = '/fishing-spots';
  static const String fishingSpotDetail = '/fishing-spots/:id';
  static const String booking = '/booking';
  static const String bookingConfirmation = '/booking-confirmation';
  static const String profile = '/profile';
  static const String payment = '/payment';

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    routes: [
      // Initial/Loading Screen
      GoRoute(
        path: initial,
        name: 'initial',
        builder: (context, state) => const InitialScreen(),
      ),

      // Splash Screen
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Onboarding Screen
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Auth Routes
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: register,
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // Home Route (Fishing Spots List)
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const SpotListScreen(),
      ),

      // Fishing Spots Routes
      GoRoute(
        path: fishingSpots,
        name: 'fishingSpots',
        builder: (context, state) => const SpotListScreen(),
      ),
      GoRoute(
        path: fishingSpotDetail,
        name: 'fishingSpotDetail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return SpotDetailScreen(spotId: id);
        },
      ),

      // Booking Routes
      GoRoute(
        path: booking,
        name: 'booking',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return BookingScreen(spotId: extra?['spotId']);
        },
      ),
      GoRoute(
        path: bookingConfirmation,
        name: 'bookingConfirmation',
        builder: (context, state) => const BookingConfirmationScreen(),
      ),

      // Profile Route
      GoRoute(
        path: profile,
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),

      // Payment Route
      GoRoute(
        path: payment,
        name: 'payment',
        builder: (context, state) => const PaymentScreen(),
      ),
    ],

    // Error page (404)
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}

// Keep all your placeholder screens below (LoginScreen, RegisterScreen, etc.)
// They stay the same

// ========================================
// PLACEHOLDER SCREENS
// (We'll replace these with real screens later)
// ========================================

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.home),
              child: const Text('Login (Mock) '),
            ),
            TextButton(
              onPressed: () => context.go(AppRouter.register),
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Register Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.home),
              child: const Text('Register (Mock)'),
            ),
            TextButton(
              onPressed: () => context.go(AppRouter.login),
              child: const Text('Already have account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.fishingSpots),
              child: const Text('Browse Fishing Spots'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.profile),
              child: const Text('My Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class FishingSpotsListScreen extends StatelessWidget {
  const FishingSpotsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fishing Spots')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.water),
            title: Text('Fishing Spot ${index + 1}'),
            subtitle: const Text('Tap to view details'),
            onTap: () => context.go('/fishing-spots/${index + 1}'),
          );
        },
      ),
    );
  }
}

class FishingSpotDetailScreen extends StatelessWidget {
  final String spotId;
  const FishingSpotDetailScreen({super.key, required this.spotId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spot #$spotId')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fishing Spot Detail #$spotId',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  context.go(AppRouter.booking, extra: {'spotId': spotId}),
              child: const Text('Book This Spot'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingScreen extends StatelessWidget {
  final String? spotId;
  const BookingScreen({super.key, this.spotId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Booking for Spot #$spotId',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.payment),
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Confirmed')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text('Booking Confirmed!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.home),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.login),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Payment Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.bookingConfirmation),
              child: const Text('Complete Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 100, color: Colors.red),
            const SizedBox(height: 20),
            const Text('Page Not Found', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
