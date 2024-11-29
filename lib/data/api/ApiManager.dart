import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/ApiConstant.dart';
import 'package:online_exam/data/api/model/response/AuthResponse.dart';
import 'package:online_exam/data/api/model/response/SubjectsResponse.dart';

@singleton
class ApiManager{
 Dio _dio;
 ApiManager(this._dio);




  Future<AuthResponse?> login(String email,String password)async{
    var response = await _dio.post(ApiConstants.signInApi,data: {
      "email":email,
      "password":password
    });
    var authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }

  Future<AuthResponse?> register(String username,String firstName,String lastName,String email,String password,String rePassword,String phone)async{
    var response = await _dio.post(ApiConstants.registerApi,data:
    {"username":username,"firstName":firstName,"lastName":lastName,"email":email,"password":password,"rePassword":rePassword,"phone":phone
    }
    );
    var authResponse = AuthResponse.fromJson(response.data);
    return authResponse;

  }
  Future<String> fogotPassword(String email) async {
    var response =
    await _dio.post(ApiConstants.forgetPasswordPath, data: {"email": email});
    return response.data['message'];
  }

  Future<bool> verifyResetPassword(String resetCode) async {
    await _dio
        .post(ApiConstants.verifyResetCodePath, data: {"resetCode": resetCode});
    return true;
  }

  Future<AuthResponse?> resetPassword(String email, String newPassword) async {
    var response = await _dio.put(ApiConstants.resetPasswordPath,
        data: {"email": email, "newPassword": newPassword});
    return AuthResponse.fromJson(response.data);
  }


  Future<SubjectResponse?> getAllSubjects(String token) async {
    print(token);
    var response = await _dio.get(ApiConstants.getAllSubjectsApi,options: Options(headers:{"token":token}));
    if (response.statusCode == 200) {
      return SubjectResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load subjects');
    }
  }

}
