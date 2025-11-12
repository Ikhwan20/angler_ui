import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:angler/config/router/app_router.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate app initialization tasks
    await Future.wait([
      _checkAuthenticationState(),
      _loadUserPreferences(),
      _loadAssets(),
      _fetchInitialData(),
    ]);

    // Loading duration (7 seconds like original)
    await Future.delayed(const Duration(seconds: 7));

    if (!mounted) return;

    // Check authentication and onboarding status
    final prefs = await SharedPreferences.getInstance();

    // Check if user is authenticated (has token)
    final authToken = prefs.getString('auth_token');
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    // Debug logs
    debugPrint(
      '🔍 Auth token exists: ${authToken != null && authToken.isNotEmpty}',
    );
    debugPrint('🔍 Has seen onboarding: $hasSeenOnboarding');

    if (!mounted) return;

    // Navigation logic
    if (authToken != null && authToken.isNotEmpty) {
      // User is logged in → Go directly to home
      debugPrint('🎣 User authenticated, navigating to home');
      context.go(AppRouter.home);
    } else if (hasSeenOnboarding) {
      // User has seen onboarding but not logged in → Go to login
      debugPrint('🎣 User seen onboarding, navigating to login');
      context.go(AppRouter.login);
    } else {
      // First time user → Go to splash/onboarding
      debugPrint('🎣 First time user, navigating to splash');
      context.go(AppRouter.splash);
    }
  }

  Future<void> _checkAuthenticationState() async {
    await Future.delayed(const Duration(milliseconds: 500));
    debugPrint('✓ Authentication checked');
  }

  Future<void> _loadUserPreferences() async {
    await Future.delayed(const Duration(milliseconds: 500));
    debugPrint('✓ Preferences loaded');
  }

  Future<void> _loadAssets() async {
    await Future.delayed(const Duration(milliseconds: 500));
    debugPrint('✓ Assets loaded');
  }

  Future<void> _fetchInitialData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    debugPrint('✓ Data fetched');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Background
          Positioned.fill(
            child: Lottie.asset(
              'assets/animations/ocean_background.json',
              fit: BoxFit.cover,
              repeat: true,
            ),
          ),

          // App Icon at the top center
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/icon/angler_icon.png',
                width: 200,
                height: 200,
              ),
            ),
          ),

          // Fisherman and Loading Bar at bottom center
          Positioned(
            left: 0,
            right: 0,
            bottom: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Fisherman Animation
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14159),
                  child: Lottie.asset(
                    'assets/animations/fishing_loading.json',
                    width: 350,
                    height: 350,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 5),

                // Loading Bar Animation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Lottie.asset(
                    'assets/animations/loading_bar.json',
                    width: 250,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
