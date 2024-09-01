import 'package:flutter_e_commerece_c11_sun/domain/entities/RegisterResponseEntity.dart';

class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
}
