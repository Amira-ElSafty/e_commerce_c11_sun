import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:flutter_e_commerece_c11_sun/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerece_c11_sun/domain/failuers.dart';
import 'package:flutter_e_commerece_c11_sun/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
