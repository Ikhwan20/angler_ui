import 'env_config.dart';

class ProdConfig {
  static EnvConfig get config => EnvConfig(
    apiBaseUrl:
        'https://jgb3myhfnj.execute-api.ap-southeast-1.amazonaws.com', // API
    appName: 'Angler',
    enableLogging: false,
    environment: 'production',
  );
}
