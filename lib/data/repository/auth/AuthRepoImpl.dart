import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/auth/AuthOfflineDataSource.dart';
import 'package:online_exam/data/contracts/auth/AuthOnlineDataSource.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/repository/AuthRepository.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository{
  AuthOnlineDatasource onlineDatasource;// DIP -> DI
  AuthOfflineDatasource offlineDatasource;

  AuthRepoImpl(this.onlineDatasource,
      this.offlineDatasource);// constructor injection

  @override
  Future<Result<User?>> login(String email, String password) {

    return onlineDatasource.login(email, password);
  }

  @override
  Future<Result<User?>> register(String username, String firstName,
      String lastName,
      String email, String password,
      String rePassword, String phone) {
    return onlineDatasource.register(username, firstName,lastName,email,password,rePassword,phone);


  }

  @override
  Future<Result<String>> forgotPassword(String email) async {
    return await onlineDatasource.forgotPassword(email);
  }

  @override
  Future<Result<bool>> verifyResetPassword(String resetCode) async {
    return await onlineDatasource.verifyResetPassword(resetCode);
  }

  @override
  Future<Result<User?>> resetPassword(String email, String newPassword) async {
    return await onlineDatasource.resetPasswprd(email, newPassword);
  }

}