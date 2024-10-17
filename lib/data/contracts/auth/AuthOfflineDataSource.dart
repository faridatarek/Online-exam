import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';

abstract class AuthOfflineDatasource{
  Future<Result<User?>> login(String email,String password);
}



