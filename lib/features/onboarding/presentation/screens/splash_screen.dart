import 'package:flutter/material.dart';
import 'package:angler/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:angler/data/models/onboarding_data_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF4A90E2), // Temporary blue background
          // TODO: Add splash background image
          image: DecorationImage(
            image: AssetImage('assets/splash/splash_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 80),

              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  //border: Border.all(color: Colors.black, width: 2),
                  // TODO: Add angler icon
                  image: DecorationImage(
                    image: AssetImage('assets/icon/angler_icon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: const Icon(Icons.phishing, size: 80), // Temporary
              ),

              const SizedBox(height: 10),

              const Text(
                'Angler',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'KaushanScript',
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Your fishing journey\nstarts here.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontFamily: 'Inter',
                  height: 1.2,
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                      fontFamily: 'Inter',
                    ),
                    children: [
                      TextSpan(
                        text: 'By using this application, you agree to our\n ',
                      ),
                      TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 233, 184, 37),
                        ),
                      ),
                      TextSpan(text: ' & '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 233, 184, 37),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 80),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/onboarding'); // Fixed: Use GoRouter
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDB022),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
