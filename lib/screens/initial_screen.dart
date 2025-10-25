import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart';
import '../ui/screens/explore/explore.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    // Small delay for smooth transition
    await Future.delayed(Duration(milliseconds: 500));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    // Remove the native splash screen
    FlutterNativeSplash.remove();

    // Navigate based on whether user has seen onboarding
    if (!hasSeenOnboarding) {
      // First time user - show splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    } else {
      // Returning user - go straight to Explore page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Explore()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}