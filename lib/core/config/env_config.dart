class EnvConfig {
  final String apiBaseUrl;
  final String appName;
  final bool enableLogging;
  final String environment;

  EnvConfig({
    required this.apiBaseUrl,
    required this.appName,
    required this.enableLogging,
    required this.environment,
  });
}
