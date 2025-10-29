import 'env_config.dart';
import 'env_dev.dart';
import 'env_prod.dart';

enum EnvironmentType {
  development,
  production,
}

class Environment {
  // Current environment - CHANGE THIS TO SWITCH ENVIRONMENTS
  static EnvironmentType _currentEnvironment = EnvironmentType.development;

  // Get current config based on environment
  static EnvConfig get config {
    switch (_currentEnvironment) {
      case EnvironmentType.development:
        return DevConfig.config;
      case EnvironmentType.production:
        return ProdConfig.config;
    }
  }

  // Helper methods
  static bool get isDevelopment => _currentEnvironment == EnvironmentType.development;
  static bool get isProduction => _currentEnvironment == EnvironmentType.production;

  // Method to set environment programmatically
  static void setEnvironment(EnvironmentType environment) {
    _currentEnvironment = environment;
  }
}