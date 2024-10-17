import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/auth/AuthOfflineDataSource.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';

@Injectable(as: AuthOfflineDatasource)
class AuthOfflineDatasourceImpl implements AuthOfflineDatasource{

  @override
  Future<Result<User?>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

}
