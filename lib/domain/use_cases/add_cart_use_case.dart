import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/AddCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../failuers.dart';

@injectable
class AddCartUseCase {
  HomeRepository homeRepository;

  AddCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}
