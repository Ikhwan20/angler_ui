import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

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

    // Check if user has seen onboarding
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = false;

    if (!mounted) return;

    if (!hasSeenOnboarding) {
      // First time user → Show splash/onboarding
      context.go('/splash');
    } else {
      // Returning user → Go directly to home
      context.go('/home');
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
