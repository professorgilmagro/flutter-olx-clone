import 'package:xlo_mobx/models/Base.dart';

enum UserType { PARTICULAR, PROFESSIONAL }

class User extends BaseModel {
  @override
  String id;
  String name;
  String email;
  String phone;
  String password;
  UserType type;

  @override
  String get tableName => 'Users';

  User({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password
    };
  }

  @override
  factory User.fromJson(Map<String, dynamic> data) {
    return User.fromJson(data);
  }

  @override
  User fromJson(Map<String, dynamic> data) {
    id = data['id'] ?? null;
    name = data['name'] ?? null;
    email = data['email'] ?? null;
    phone = data['phone'] ?? null;
    password = data['password'] ?? null;

    return this;
  }
}
