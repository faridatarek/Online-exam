import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/Subject.dart';

abstract class ExamsRepository{
  Future<Result<List<Subject>>> getAllSubjects(String token);

}