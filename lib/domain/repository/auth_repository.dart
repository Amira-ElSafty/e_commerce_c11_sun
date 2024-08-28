import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/RegisterResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/failuers.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);
}
