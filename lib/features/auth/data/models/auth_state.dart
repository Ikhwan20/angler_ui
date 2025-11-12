import 'package:angler/data/models/user_model.dart';

enum AuthStatus {
  initial, // App just started, checking auth
  authenticated, // User is logged in
  unauthenticated, // User is logged out
  loading, // Login/logout in progress
}

class AuthState {
  final AuthStatus status;
  final UserModel? user;
  final String? token;
  final String? errorMessage;

  AuthState({required this.status, this.user, this.token, this.errorMessage});

  // Initial state
  factory AuthState.initial() {
    return AuthState(status: AuthStatus.initial);
  }

  // Loading state
  factory AuthState.loading() {
    return AuthState(status: AuthStatus.loading);
  }

  // Authenticated state
  factory AuthState.authenticated({
    required UserModel user,
    required String token,
  }) {
    return AuthState(
      status: AuthStatus.authenticated,
      user: user,
      token: token,
    );
  }

  // Unauthenticated state
  factory AuthState.unauthenticated({String? errorMessage}) {
    return AuthState(
      status: AuthStatus.unauthenticated,
      errorMessage: errorMessage,
    );
  }

  // Convenience getters
  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isUnauthenticated => status == AuthStatus.unauthenticated;
  bool get isLoading => status == AuthStatus.loading;
  bool get isInitial => status == AuthStatus.initial;

  // CopyWith for state updates
  AuthState copyWith({
    AuthStatus? status,
    UserModel? user,
    String? token,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    return 'AuthState(status: $status, user: ${user?.name}, hasToken: ${token != null})';
  }
}
