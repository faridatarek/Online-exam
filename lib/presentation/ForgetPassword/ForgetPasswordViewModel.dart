import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/usecase/ForgetPasswordUseCase.dart';

@injectable
class ForegetPasswordViewmodel extends Cubit<ForgetPasswordState> {
  ForgetPasswordUsecase forgetPasswordUsecase;
  ForegetPasswordViewmodel(this.forgetPasswordUsecase)
      : super(InitialState(null));

  void doIntent(ForgetPasswordScreenIntent intent) {
    switch (intent) {
      case VerifyEmailIntent():
        {
          _checkEmail(intent);
        }
      case VerifyOtpIntent():
        {
          _verifyOtp(intent);
        }
      case ResetPasswordIntent():
        {
          _resetPassword(intent);
        }
    }
  }

  Future<void> _checkEmail(VerifyEmailIntent intent) async {
    emit(LoadingState());

    var result = await forgetPasswordUsecase.forgotPassword(intent.email);
    switch (result) {
      case Success<String>():
        {
          emit(VerifyOtpState(intent.email, null));
        }
      case Fail<String>():
        {
          emit(InitialState(result.exception));
        }
    }
  }

  Future<void> _verifyOtp(VerifyOtpIntent intent) async {
    emit(LoadingState());
    var result = await forgetPasswordUsecase.verifyResetPassword(intent.otp);
    switch (result) {
      case Success<bool>():
        {
          emit(ResetPasswordState(intent.email, null));
        }
      case Fail<bool>():
        {
          emit(VerifyOtpState(intent.email, result.exception));
        }
    }
  }

  Future<void> _resetPassword(ResetPasswordIntent intent) async {
    emit(LoadingState());
    print(intent.newPassword);
    print(intent.email);
    var result = await forgetPasswordUsecase.resetPassword(
        intent.email, intent.newPassword);
    switch (result) {
      case Success<User?>():
        {
          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ResetPasswordState(intent.email, result.exception));
        }
    }
  }
}

sealed class ForgetPasswordScreenIntent {}

class VerifyEmailIntent extends ForgetPasswordScreenIntent {
  String email;
  VerifyEmailIntent(this.email);
}

class VerifyOtpIntent extends ForgetPasswordScreenIntent {
  String email;
  String otp;
  VerifyOtpIntent(this.email, this.otp);
}

class ResetPasswordIntent extends ForgetPasswordScreenIntent {
  String email;
  String newPassword;
  ResetPasswordIntent(this.email, this.newPassword);
}

sealed class ForgetPasswordState {}

class InitialState extends ForgetPasswordState {
  Exception? error;
  InitialState(this.error);
}

class LoadingState extends ForgetPasswordState {}

class VerifyOtpState extends ForgetPasswordState {
  String? email;
  Exception? error;
  VerifyOtpState(this.email, this.error);
}

class ResetPasswordState extends ForgetPasswordState {
  String? email;
  Exception? error;
  ResetPasswordState(this.email, this.error);
}

class SuccessState extends ForgetPasswordState {
  User? user;
  SuccessState(this.user);
}