import 'package:online_exam/domain/model/User.dart';

class UserDto {
  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isVerified,
    this.token,});

  UserDto.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['isVerified'];
    token = json['token'];
  }
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['isVerified'] = isVerified;
    map['token'] = token;
    return map;
  }

  User toUser(){
    return User(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone:  phone,
        isVerified: isVerified,
        token: token

    );
  }

}