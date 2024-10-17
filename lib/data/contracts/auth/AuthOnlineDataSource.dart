import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';

abstract class AuthOnlineDatasource{
  Future<Result<User?>> login(String email,String password);
  Future<Result<User?>> register(String username, String firstName,
      String lastName,
      String email, String password,
      String rePassword, String phone);
}