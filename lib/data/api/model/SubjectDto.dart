import 'package:online_exam/domain/model/Subject.dart';

/*class SubjectModel extends Subject {
  const SubjectModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.createdAt,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    createdAt: json["createdAt"],
  );
}*/
/*class SubjectDto {
  SubjectDto({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });


  SubjectDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }

  String? id;
  String? name;
  String? icon;
  String? createdAt;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['createdAt'] = createdAt;
    return map;
  }


  Subject toSubject() {
    return Subject(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}*/


class SubjectDto extends Subject {
  const SubjectDto({
     super.id,
     super.name,
     super.icon,
     super.createdAt,

  });

  factory SubjectDto.fromJson(Map<String, dynamic> json) => SubjectDto(
    id: json["_id"],
    name: json["name"],
    icon: json["icon"],
    createdAt: json["createdAt"],
  );
  Subject toSubject() {
    return Subject(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}
