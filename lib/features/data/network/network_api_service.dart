import 'dart:io';

import 'package:http/http.dart' as http;
import '../../../core/errors/app_exception.dart';
import '../../../core/utils/api_constants.dart';
import '../../../core/utils/app_constants.dart';

class NetworkApiServices {
  Future<http.Response> getWeather(double lat,long) async {
    try {
      http.Response response = await http.get(Uri.parse(ApiConstants.weatherApiPath(lat, long)));
      return _errorHandler(response);
    } on SocketException {
      throw InternetServerErrorException(AppConstance.internalConnection);
    }
  }

  http.Response _errorHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        throw NoContentException(AppConstance.noContent);
      case 400:
        throw BadRequestException(AppConstance.noContent);
      case 401:
        throw UnauthorizedException(AppConstance.unauthorizedError);
      case 403:
        throw ForbiddenException(AppConstance.forbiddenError);
      case 404:
        throw InternetServerErrorException(AppConstance.internalServerError);
      case 500:
        throw NotFoundException(AppConstance.notFoundError);
      default:
        throw UnknownErrorException(AppConstance.unknownError);
    }
  }
}
