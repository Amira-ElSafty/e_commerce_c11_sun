import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_sun/core/widget/shared_preference_utils.dart';
import 'package:flutter_e_commerece_c11_sun/data/api_manager.dart';
import 'package:flutter_e_commerece_c11_sun/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:flutter_e_commerece_c11_sun/data/end_points.dart';
import 'package:flutter_e_commerece_c11_sun/data/model/AddCartResponseDto.dart';
import 'package:flutter_e_commerece_c11_sun/data/model/CategoryResponseDto.dart';
import 'package:flutter_e_commerece_c11_sun/data/model/ProductResponseDto.dart';
import 'package:flutter_e_commerece_c11_sun/domain/failuers.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoints.getAllCategories);

        var categoryResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        // no internet
        return Left(NetworkError(
            errorMessage: 'No Internet connection , Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoints.getAllBrands);
        var brandResponse = CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorMessage: brandResponse.message!));
        }
      } else {
        // no internet
        return Left(NetworkError(
            errorMessage: 'No Internet connection , Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoints.getAllProducts);
        var productResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        // no internet
        return Left(NetworkError(
            errorMessage: 'No Internet connection , Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddCartResponseDto>> addToCart(
      String productId) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.postData(EndPoints.addToCart,
            body: {"productId": productId},
            headers: {'token': token.toString()});
        var addToCartResponse = AddCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToCartResponse);
        } else if (response.statusCode == 401) {
          return Left(ServerError(errorMessage: addToCartResponse.message!));
        } else {
          return Left(ServerError(errorMessage: addToCartResponse.message!));
        }
      } else {
        // no internet
        return Left(NetworkError(
            errorMessage: 'No Internet connection , Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
