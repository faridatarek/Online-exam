import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/ApiExtenstion.dart';
import 'package:online_exam/data/api/ApiManager.dart';
import 'package:online_exam/data/contracts/exams/ExamsOnlineDataSource.dart';
import 'package:online_exam/domain/common/ApiResult.dart';
import 'package:online_exam/domain/model/Subject.dart';
@Injectable(as: ExamsOnlineDataSource)
class ExamsOnlineDataSourceImpl implements ExamsOnlineDataSource {
  ApiManager apiManager;

  ExamsOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Subject>>> getAllSubjects(String token) {
    return executeApi(() async {
      var response = await apiManager.getAllSubjects(token);

      // Use an empty list if subjects is null, avoiding explicit Fail
      List<Subject> subjects = response?.subjects?.map((dto) => dto.toSubject()).toList() ?? [];
      return subjects;
    });
  }




}



