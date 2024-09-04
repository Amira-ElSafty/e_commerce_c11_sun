// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api_manager.dart' as _i3;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i4;
import '../../data/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i8;
import '../../data/data_sources/remote_data_source/impl/auth_remote_data_source_impl.dart'
    as _i5;
import '../../data/data_sources/remote_data_source/impl/home_remote_data_source_impl.dart'
    as _i9;
import '../../data/repository/auth_repository_impl.dart' as _i7;
import '../../data/repository/home_repository_impl.dart' as _i11;
import '../../features/auth/presentation/screens/login/cubit/login_view_model.dart'
    as _i13;
import '../../features/auth/presentation/screens/register/cubit/register_view_model.dart'
    as _i15;
import '../../features/main_layout/home/presentation/cubit/home_tab_view_model.dart'
    as _i20;
import '../../features/products_screen/presentation/cubit/product_screen_view_model.dart'
    as _i21;
import '../repository/auth_repository.dart' as _i6;
import '../repository/home_repository.dart' as _i10;
import '../use_cases/add_cart_use_case.dart' as _i16;
import '../use_cases/get_all_brands_use_case.dart' as _i17;
import '../use_cases/get_all_categories_use_case.dart' as _i18;
import '../use_cases/get_all_products_use_case.dart' as _i19;
import '../use_cases/login_use_case.dart' as _i12;
import '../use_cases/register_use_case.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AuthRemoteDataSource>(
        () => _i5.AuthRemoteDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepository>(() => _i7.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i4.AuthRemoteDataSource>()));
    gh.factory<_i8.HomeRemoteDataSource>(
        () => _i9.HomeRemoteDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i10.HomeRepository>(() => _i11.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i8.HomeRemoteDataSource>()));
    gh.factory<_i12.LoginUseCase>(
        () => _i12.LoginUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i13.LoginViewModel>(
        () => _i13.LoginViewModel(loginUseCase: gh<_i12.LoginUseCase>()));
    gh.factory<_i14.RegisterUseCase>(
        () => _i14.RegisterUseCase(authRepository: gh<_i6.AuthRepository>()));
    gh.factory<_i15.RegisterViewModel>(() =>
        _i15.RegisterViewModel(registerUseCase: gh<_i14.RegisterUseCase>()));
    gh.factory<_i16.AddCartUseCase>(
        () => _i16.AddCartUseCase(homeRepository: gh<_i10.HomeRepository>()));
    gh.factory<_i17.GetAllBrandsUseCase>(() =>
        _i17.GetAllBrandsUseCase(homeRepository: gh<_i10.HomeRepository>()));
    gh.factory<_i18.GetAllCategoriesUseCase>(() => _i18.GetAllCategoriesUseCase(
        homeRepository: gh<_i10.HomeRepository>()));
    gh.factory<_i19.GetAllProductsUseCase>(() =>
        _i19.GetAllProductsUseCase(homeRepository: gh<_i10.HomeRepository>()));
    gh.factory<_i20.HomeTabViewModel>(() => _i20.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i18.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i17.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i21.ProductScreenViewModel>(() => _i21.ProductScreenViewModel(
          getAllProductsUseCase: gh<_i19.GetAllProductsUseCase>(),
          addCartUseCase: gh<_i16.AddCartUseCase>(),
        ));
    return this;
  }
}
