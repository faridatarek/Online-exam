import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/*
@module
abstract class TokenProvider{
  Future<String?>getToken()async{
    FlutterSecureStorage _secureStorage= FlutterSecureStorage();
    return await _secureStorage.read(key: "token");
  }
}

*/











@module
abstract class TokenProvider {
  @preResolve
  Future<String> getToken() async {
   FlutterSecureStorage _secureStorage =const FlutterSecureStorage();
    final token = await _secureStorage.read(key: "token");
    return token ?? ''; // Default to an empty string if token is null
  }
}
