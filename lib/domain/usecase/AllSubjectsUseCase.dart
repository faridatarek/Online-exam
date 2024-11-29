import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/SubjectDto.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/Subject.dart';
import 'package:online_exam/domain/repository/ExamsRepository.dart';

@injectable
class GetAllSubjectsUseCase{
  ExamsRepository examsRepository;
  GetAllSubjectsUseCase(this.examsRepository);

  Future<Result<List<Subject>>> invoke(String token)async{
    return await examsRepository.getAllSubjects(token);

  }
}