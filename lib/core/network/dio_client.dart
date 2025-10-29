import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:angler/core/network/endpoints.dart';
import 'package:angler/core/errors/exceptions.dart';
import 'package:angler/core/config/environment.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.config.apiBaseUrl, // this line will uses environemtn config(before this is hardcoded)
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors dalam development mode
    if (Environment.config.enableLogging) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      );
    }
  }

  // Getter to access dio instance
  Dio get dio => _dio;

  // Set authorization token
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Remove authorization token
  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  // GET request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw AppException('Unexpected error: $e');
    }
  }

  // POST request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw AppException('Unexpected error: $e');
    }
  }

  // PUT request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw AppException('Unexpected error: $e');
    }
  }

  // DELETE request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw AppException('Unexpected error: $e');
    }
  }

  // PATCH request
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw AppException('Unexpected error: $e');
    }
  }

  // Handle Dio errors and convert to custom exceptions
  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException('Connection timeout');

      case DioExceptionType.connectionError:
        return NetworkException('No internet connection');

      case DioExceptionType.badResponse:
        return _handleHttpError(error.response?.statusCode);

      case DioExceptionType.cancel:
        return AppException('Request cancelled');

      default:
        return AppException('Unexpected error occurred');
    }
  }

  // Handle HTTP status code errors
  Exception _handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return BadRequestException('Invalid request');
      case 401:
        return UnauthorizedException('Please login again');
      case 403:
        return ForbiddenException('Access denied');
      case 404:
        return NotFoundException('Resource not found');
      case 500:
      case 502:
      case 503:
        return ServerException('Server error occurred');
      default:
        return AppException('Error: $statusCode');
    }
  }
}
