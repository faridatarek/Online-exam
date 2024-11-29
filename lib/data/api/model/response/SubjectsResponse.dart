import 'package:online_exam/data/api/model/SubjectDto.dart';

class SubjectResponse {
  final String? message;
  final List<SubjectDto>? subjects;

  SubjectResponse({this.message, this.subjects});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return SubjectResponse(
      message: json['message'] as String?,
      subjects: (json['subjects'] as List?)?.map((subjectJson) {
        return SubjectDto.fromJson(subjectJson);
      }).toList(),
    );
  }


}