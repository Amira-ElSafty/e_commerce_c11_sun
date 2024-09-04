import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/failuers.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);
}
