import 'package:intl/intl.dart';

class AppConstance {
  static const String badRequestError = "Bad request error";
  static const String noContent = "No content";
  static const String forbiddenError = "Forbidden error";
  static const String unauthorizedError = "Unauthorized error";
  static const String notFoundError = "Not found error";
  static const String conflictError = "Conflict error";
  static const String internalServerError = "Internal server error";
  static const String internalConnection = "No Internet Connection";
  static const String unknownError = "Unknown error";
  static const String timeoutError = "Timeout error";
  static const String defaultError = "Default error";
  static const String cacheError = "Cache error";
  static const String noInternetError = "No internet error";

  static DateTime dateTime = DateTime.now();

  static String currentData = DateFormat("d MMMM, E").format(dateTime);
}
