import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/providers/appConfigProvider.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/Subject.dart';
import 'package:online_exam/domain/usecase/AllSubjectsUseCase.dart';

/*
class SubjectsViewModel extends Cubit<SubjectScreenState>{
  GetAllSubjectsUseCase allSubjectsUseCase;
  SubjectsViewModel(this.allSubjectsUseCase):super(InitialState());

}



sealed class SubjectScreenState{

}
class InitialState extends SubjectScreenState{}
class LoadingState extends SubjectScreenState{}
class ErrorState extends SubjectScreenState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends SubjectScreenState{
  Subject? subject;
  SuccessState(this.subject);

}
*/


@injectable
class SubjectsViewModel extends Cubit<SubjectScreenState> {
  final GetAllSubjectsUseCase allSubjectsUseCase;
AppConfigProvider appConfigProvider;
  SubjectsViewModel(this.allSubjectsUseCase,this.appConfigProvider) : super(InitialState());

  void doIntent(SubjectScreenIntent intent) {
    switch (intent) {
      case FetchSubjectsIntent():
        _fetchSubjects();
        break;

    }
  }

  void _fetchSubjects() async {
    emit(LoadingState());

    var result = await allSubjectsUseCase.invoke(appConfigProvider.token);
    switch (result) {
      case Success<List<Subject>>():
        emit(SuccessState(result.data));
        break;
      case Fail<List<Subject>>():
        emit(ErrorState(result.exception));
        break;
    }
  }
}

sealed class SubjectScreenIntent {}

class FetchSubjectsIntent extends SubjectScreenIntent {}

sealed class SubjectScreenState {}

class InitialState extends SubjectScreenState {}

class LoadingState extends SubjectScreenState {}

class ErrorState extends SubjectScreenState {
  final Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends SubjectScreenState {
  final List<Subject>? subjects;
  SuccessState(this.subjects);
}
