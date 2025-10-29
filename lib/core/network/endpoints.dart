class Endpoints {
  Endpoints._();

  // Base URL - Change this to your actual API URL
  static const String baseUrl = 'https://api.';

  // Auth Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // User Endpoints
  static const String userProfile = '/user/profile';
  static const String updateProfile = '/user/profile/update';

  // Fishing Spots Endpoints
  static const String fishingSpots = '/fishing-spots';
  static String fishingSpotDetail(String id) => '/fishing-spots/$id';
  static const String searchSpots = '/fishing-spots/search';

  // Booking Endpoints
  static const String bookings = '/bookings';
  static String bookingDetail(String id) => '/bookings/$id';
  static const String createBooking = '/bookings/create';
  static String cancelBooking(String id) => '/bookings/$id/cancel';

  // Payment Endpoints
  static const String payments = '/payments';
  static const String processPayment = '/payments/process';
  static String paymentStatus(String id) => '/payments/$id/status';
}