import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/SubjectDto.dart';
import 'package:online_exam/data/contracts/exams/ExamsOnlineDataSource.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/Subject.dart';
import 'package:online_exam/domain/repository/ExamsRepository.dart';

import '../../../domain/common/ApiResult.dart';
/*
@Injectable(as: ExamsRepository)
class ExamsRepositoryImpl implements ExamsRepository {
  final ExamsOnlineDataSource onlineDataSource;


  ExamsRepositoryImpl(this.onlineDataSource);

  @override
  Future<Result<List<Subject>>> getAllSubjects() {
    throw UnimplementedError();
  }
}
*/


/*@Injectable(as: ExamsRepository)
class ExamsRepositoryImpl implements ExamsRepository {
  final ExamsOnlineDataSource onlineDataSource;

  ExamsRepositoryImpl(this.onlineDataSource);

  @override
  Future<Result<List<Subject>>> getAllSubjects() async {
    try {
      // Fetch the list of SubjectDto from the online data source
      List<SubjectDto> subjectDtos = await onlineDataSource.getAllSubjects();

      // Convert SubjectDto to Subject
      List subjects = subjectDtos.map((dto) => dto.toSubject()).toList();

      // Return the result as a success
      return Result.success(subjects);
    } catch (e) {
      // Handle any errors and return as a failure
      return Result.fail(Failure(message: e.toString()));
    }
  }
}*/

@Injectable(as: ExamsRepository)
class ExamsRepositoryImpl implements ExamsRepository {
  final ExamsOnlineDataSource onlineDataSource;

  ExamsRepositoryImpl(this.onlineDataSource);

  @override
  Future<Result<List<Subject>>> getAllSubjects(String token) async {

      // Fetch the result from the online data source
      final Result<List<Subject>> result = await onlineDataSource.getAllSubjects(token);
      return result;


  }
}



