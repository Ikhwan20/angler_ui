import 'env_config.dart';

class DevConfig {
  static EnvConfig get config => EnvConfig(
        apiBaseUrl: 'http://localhost:61689/api/v1', // Your local API
        appName: 'Angler (Dev)',
        enableLogging: true,
        environment: 'development',
      );
}