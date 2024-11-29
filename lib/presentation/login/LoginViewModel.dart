import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/providers/appConfigProvider.dart';
import 'package:online_exam/core/res/toke_manager.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/usecase/LoginUseCase.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState>{
AppConfigProvider appConfigProvider ;
  LoginUseCase loginCase;
bool isChecked = false;

//                        start state
  LoginViewModel(this.loginCase,this.appConfigProvider):super(InitialState());

  void doIntent(LoginScreenIntent intent){
    switch (intent) {

      case LoginIntent():_login(intent);
      case CheckfieldsInent():_checkfields(intent);
    }
  }
  void _login(LoginIntent intent) async{
    emit(LoadingState());

    var result = await loginCase.invoke(intent.email,
        intent.password);
    switch (result) {

      case Success<User?>():{
        if(isChecked) {
        await  TokenManager.setToken(result.data?.token??"");
        appConfigProvider.token=result.data?.token??"" ;
        }

        emit(SuccessState(result.data));
      }
      case Fail<User?>():{
        emit(ErrorState(result.exception));
      }
    }
  }

  void _checkfields(CheckfieldsInent intent ){
    //
  }


}
sealed class LoginScreenIntent{}
class LoginIntent extends LoginScreenIntent{
  String email;
  String password;
  LoginIntent(this.email,this.password);
}
class CheckfieldsInent extends LoginScreenIntent{

}

sealed class LoginScreenState{}
class InitialState extends LoginScreenState{}
class LoadingState extends LoginScreenState{}
class ErrorState extends LoginScreenState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends LoginScreenState{
  User? user;
  SuccessState(this.user);

}





