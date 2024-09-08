import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/failuers.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateItemCountInCart(
      String productId, int count);
}
