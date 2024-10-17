/*class User {
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isVerified,
    this.token});

  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;
  String? token;
}*/
class User {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;
  bool? isVerified;
  String? token;
  User(
      {this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.rePassword,
        this.phone,
        this.isVerified,
        this.token,
        String? id});

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json['username'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    rePassword: json['rePassword'] as String?,
    phone: json['phone'] as String?,
    isVerified: json['isverified'] as bool?,
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'rePassword': rePassword,
    'phone': phone,
    'isverified': isVerified,
    'token': token,
  };
}