import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/repository/AuthRepository.dart';

@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Result<User?>> invoke(String
  username,
  firstName,
  lastName,
  email,
  password,
  rePassword,
  phone)

  {
    return authRepository.register( username,firstName,lastName, email, password,rePassword, phone);
  }
}