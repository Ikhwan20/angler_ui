import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:angler/config/router/app_router.dart';
import 'package:angler/core/config/environment.dart';

void main() {
  print('Environment: ${Environment.config.environment}');
  print('API URL: ${Environment.config.apiBaseUrl}');
  print('Logging: ${Environment.config.enableLogging}');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // title: 'Angler', // this is static title before
      title: Environment
          .config
          .appName, // this uses environment config (more dynamic)
      debugShowCheckedModeBanner:
          Environment.isDevelopment, //debug word kt atas kanan
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A90E2)),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
