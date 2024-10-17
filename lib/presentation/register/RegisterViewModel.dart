import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/usecase/RegisterUseCase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterScreenState>{
RegisterUseCase registerUseCase;

RegisterViewModel(this.registerUseCase):super(InitialState());

  void doIntent(RegisterScreenIntent intent){
    switch (intent) {

      case RegisterIntent():_register(intent);
      case CheckfieldsInent():_checkfields(intent);
    }
  }
  void _register(RegisterIntent intent) async{
    emit(LoadingState());

    var result = await registerUseCase.invoke(
        intent.username, intent.firstName,intent.lastName,intent.email,intent.password,intent.rePassword,intent.phone);
    switch (result) {

      case Success<User?>():{
        emit(SuccessState(result.data));
      }
      case Fail<User?>():{
        emit(ErrorState(result.exception));
      }
    }
  }

  void _checkfields(CheckfieldsInent intent ){

  }


}
sealed class RegisterScreenIntent{}
class RegisterIntent extends RegisterScreenIntent{

  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;


  RegisterIntent(this.username,this.firstName,this.lastName,this.email,this.password,this.rePassword,this.phone);
}
class CheckfieldsInent extends RegisterScreenIntent{

}

sealed class RegisterScreenState{}
class InitialState extends RegisterScreenState{}
class LoadingState extends RegisterScreenState{}
class ErrorState extends RegisterScreenState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends RegisterScreenState{
  User? user;
  SuccessState(this.user);

}


