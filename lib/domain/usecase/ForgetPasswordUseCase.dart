import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/repository/AuthRepository.dart';

@injectable
class ForgetPasswordUsecase {
  AuthRepository authRepository;

  ForgetPasswordUsecase(this.authRepository);

  Future<Result<String>> forgotPassword(String email) async {
    return await authRepository.forgotPassword(email);
  }

  Future<Result<bool>> verifyResetPassword(String resetCode) async {
    return await authRepository.verifyResetPassword(resetCode);
  }

  Future<Result<User?>> resetPassword(String email, String newPassword) async {
    return await authRepository.resetPassword(email, newPassword);
  }
}