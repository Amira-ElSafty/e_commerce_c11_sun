import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../failuers.dart';

@injectable
class GetAllProductsUseCase {
  HomeRepository homeRepository;

  GetAllProductsUseCase({required this.homeRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeRepository.getAllProducts();
  }
}
