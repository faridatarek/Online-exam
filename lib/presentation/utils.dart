import 'package:online_exam/domain/common/CustomExceptions.dart';

String extractErrorMessage(Exception? exception){
  var message = "something went wrong";
  if(exception is NoInternetError){
    message = "please check internet connection";
  }else if (exception is ServerError){
    message = exception.serverMessage ??"something went wrong";
  }else if(exception is DioHttpException){
    if(exception.exception?.response?.statusCode == 401){
      message = "please login again";
    }
    message = exception.exception?.message ?? "something went wrong";
  }
  return message;
}