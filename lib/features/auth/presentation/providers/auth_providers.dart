import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:angler/data/models/user_model.dart';
import 'package:angler/features/auth/data/models/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.initial()) {
    _checkAuthStatus();
  }

  // Keys for SharedPreferences
  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';

  // Check if user is already logged in
  Future<void> _checkAuthStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_tokenKey);

      if (token != null && token.isNotEmpty) {
        // User has saved token, restore user data
        final userId = prefs.getString(_userIdKey) ?? '';
        final userName = prefs.getString(_userNameKey) ?? '';
        final userEmail = prefs.getString(_userEmailKey) ?? '';

        final user = UserModel(
          id: userId,
          name: userName,
          email: userEmail,
          createdAt: DateTime.now(),
        );

        state = AuthState.authenticated(user: user, token: token);
      } else {
        state = AuthState.unauthenticated();
      }
    } catch (e) {
      state = AuthState.unauthenticated(
        errorMessage: 'Failed to check auth status',
      );
    }
  }

  // Login
  Future<bool> login({required String email, required String password}) async {
    state = AuthState.loading();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with actual API call
      // For now, accept any email/password

      // Mock user data
      final user = UserModel(
        id: '1',
        name: email.split('@')[0], // Use email prefix as name
        email: email,
        createdAt: DateTime.now(),
      );

      // Mock token
      final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';

      // Save to SharedPreferences
      await _saveAuthData(user: user, token: token);

      // Update state
      state = AuthState.authenticated(user: user, token: token);

      return true;
    } catch (e) {
      state = AuthState.unauthenticated(
        errorMessage: 'Login failed: ${e.toString()}',
      );
      return false;
    }
  }

  // Register
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = AuthState.loading();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with actual API call

      // Mock user data
      final user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        createdAt: DateTime.now(),
      );

      // Mock token
      final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';

      // Save to SharedPreferences
      await _saveAuthData(user: user, token: token);

      // Update state
      state = AuthState.authenticated(user: user, token: token);

      return true;
    } catch (e) {
      state = AuthState.unauthenticated(
        errorMessage: 'Registration failed: ${e.toString()}',
      );
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    state = AuthState.loading();

    try {
      // Clear SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      await prefs.remove(_userIdKey);
      await prefs.remove(_userNameKey);
      await prefs.remove(_userEmailKey);

      // Update state
      state = AuthState.unauthenticated();
    } catch (e) {
      // Even if clearing fails, set as unauthenticated
      state = AuthState.unauthenticated(errorMessage: 'Logout failed');
    }
  }

  // Save auth data to SharedPreferences
  Future<void> _saveAuthData({
    required UserModel user,
    required String token,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userIdKey, user.id);
    await prefs.setString(_userNameKey, user.name);
    await prefs.setString(_userEmailKey, user.email);
  }

  // Get current user
  UserModel? get currentUser => state.user;

  // Get auth token
  String? get token => state.token;

  // Check if authenticated
  bool get isAuthenticated => state.isAuthenticated;
}

// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
