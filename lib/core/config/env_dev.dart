import 'env_config.dart';

class DevConfig {
  static EnvConfig get config => EnvConfig(
    apiBaseUrl:
        'https://jgb3myhfnj.execute-api.ap-southeast-1.amazonaws.com', // API
    appName: 'Angler (Dev)',
    enableLogging: true,
    environment: 'development',
  );
}
