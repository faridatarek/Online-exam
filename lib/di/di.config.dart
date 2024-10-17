// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/ApiManager.dart' as _i3;
import '../data/contracts/auth/AuthOfflineDataSource.dart' as _i4;
import '../data/contracts/auth/AuthOnlineDataSource.dart' as _i6;
import '../data/datasource/auth/AuthOfflineDataSourceImpl.dart' as _i5;
import '../data/datasource/auth/AuthOnlineDataSourceImpl.dart' as _i7;
import '../data/repository/auth/AuthRepoImpl.dart' as _i9;
import '../domain/repository/AuthRepository.dart' as _i8;
import '../domain/usecase/ForgetPasswordUseCase.dart' as _i10;
import '../domain/usecase/LoginUseCase.dart' as _i11;
import '../domain/usecase/RegisterUseCase.dart' as _i13;
import '../presentation/ForgetPassword/ForgetPasswordViewModel.dart' as _i15;
import '../presentation/login/LoginViewModel.dart' as _i12;
import '../presentation/register/RegisterViewModel.dart' as _i14;

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
    gh.lazySingleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AuthOfflineDatasource>(
        () => _i5.AuthOfflineDatasourceImpl());
    gh.factory<_i6.AuthOnlineDatasource>(
        () => _i7.AuthOnlineDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.AuthRepository>(() => _i9.AuthRepoImpl(
          gh<_i6.AuthOnlineDatasource>(),
          gh<_i4.AuthOfflineDatasource>(),
        ));
    gh.factory<_i10.ForgetPasswordUsecase>(
        () => _i10.ForgetPasswordUsecase(gh<_i8.AuthRepository>()));
    gh.factory<_i11.LoginUseCase>(
        () => _i11.LoginUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i12.LoginViewModel>(
        () => _i12.LoginViewModel(gh<_i11.LoginUseCase>()));
    gh.factory<_i13.RegisterUseCase>(
        () => _i13.RegisterUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i14.RegisterViewModel>(
        () => _i14.RegisterViewModel(gh<_i13.RegisterUseCase>()));
    gh.factory<_i15.ForegetPasswordViewmodel>(
        () => _i15.ForegetPasswordViewmodel(gh<_i10.ForgetPasswordUsecase>()));
    return this;
  }
}
