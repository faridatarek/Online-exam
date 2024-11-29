import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/providers/appConfigProvider.dart';
import 'package:online_exam/data/api/ApiConstant.dart';
import 'package:online_exam/di/di.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract  class NetworkMedule{
  @lazySingleton
  Dio provideDio(){
     Dio
     _dio = Dio(BaseOptions(
         baseUrl: ApiConstants.baseUrl
     ));
     _dio.options.headers={"token":getIt<AppConfigProvider>().token};
     _dio.interceptors.add(PrettyDioLogger(
       responseHeader: true,
       requestHeader: true,
       responseBody: true,
       requestBody: true,
       logPrint: (object) {
         debugPrint("Api -> $object");
       },
     ));
    return _dio ;
}
}