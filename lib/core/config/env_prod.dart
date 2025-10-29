import 'env_config.dart';

class ProdConfig {
  static EnvConfig get config => EnvConfig(
        apiBaseUrl: 'https://api.angler.com/v1', // Your production API
        appName: 'Angler',
        enableLogging: false,
        environment: 'production',
      );
}