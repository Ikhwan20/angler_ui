import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:angler/core/network/dio_client.dart';

// ========================================
// CORE PROVIDERS
// ========================================

/// Provides DioClient instance
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

// ========================================
// REPOSITORY PROVIDERS
// ========================================
// We'll add repository providers here later when we create repositories
// Example:
// final userRepositoryProvider = Provider<UserRepository>((ref) {
//   final dioClient = ref.watch(dioClientProvider);
//   return UserRepositoryImpl(dioClient: dioClient);
// });