import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/repository/AuthRepository.dart';

import '../common/ApiResult.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email,password){
    return authRepository.login(email, password);
  }
}