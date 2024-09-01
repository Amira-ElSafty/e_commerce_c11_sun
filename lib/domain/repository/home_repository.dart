import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/failuers.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();
}
