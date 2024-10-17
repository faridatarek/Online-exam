import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/ApiManager.dart';
import 'package:online_exam/data/api/model/UserDto.dart';
import 'package:online_exam/data/api/model/request/RegisterRequest.dart';
import 'package:online_exam/data/contracts/auth/AuthOnlineDataSource.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import '../../api/ApiExtenstion.dart';

@Injectable(as: AuthOnlineDatasource)
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource{

  ApiManager apiManager;

  AuthOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<User?>> login(String email, String password)async {

    return executeApi<User>(()async{
      var authResponse = await apiManager.login(email, password);
      var userDto = UserDto(token: authResponse?.token);
      return userDto.toUser();

    },);
  }
  @override
  Future<Result<User?>> register(String username, String firstName,
      String lastName, String email,
      String password, String rePassword, String phone) async{

    return executeApi<User>(()async{
      var response = await apiManager.register(username,firstName,lastName,email,password,rePassword,phone);
      var userDto = UserDto(token:response?.token);
      return userDto.toUser();
    },);

  }

}