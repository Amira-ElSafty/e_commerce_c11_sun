import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failuers.dart';

@injectable
class GetCartUseCase {
  CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartRepository.getCart();
  }
}
