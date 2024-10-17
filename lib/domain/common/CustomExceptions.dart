import 'package:dio/dio.dart';

/*class ServerError implements Exception{
  String? serverMessage;
  int? statusCode;
  ServerError(this.serverMessage,this.statusCode);
}
class DioHttpException implements Exception{
  DioException? exception;
  DioHttpException(this.exception);
}
class NoInternetError implements Exception{

}*/

// ServerError to represent server-related errors
class ServerError implements Exception {
  final String? serverMessage;
  final int? statusCode;
  ServerError(this.serverMessage, this.statusCode);
}

// DioHttpException to represent HTTP-related errors from Dio
class DioHttpException implements Exception {
  final DioException? exception;
  DioHttpException(this.exception);
}

// NoInternetError to represent a lack of internet connection
class NoInternetError implements Exception {}