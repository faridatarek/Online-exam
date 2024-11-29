// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/providers/appConfigProvider.dart' as _i3;
import '../core/res/token_provider.dart' as _i25;
import '../data/api/ApiManager.dart' as _i7;
import '../data/api/nerworkMedule.dart' as _i24;
import '../data/contracts/auth/AuthOfflineDataSource.dart' as _i4;
import '../data/contracts/auth/AuthOnlineDataSource.dart' as _i8;
import '../data/contracts/exams/ExamsOnlineDataSource.dart' as _i12;
import '../data/datasource/auth/AuthOfflineDataSourceImpl.dart' as _i5;
import '../data/datasource/auth/AuthOnlineDataSourceImpl.dart' as _i9;
import '../data/datasource/exams/ExamsOnlineDataSourceImpl.dart' as _i13;
import '../data/repository/auth/AuthRepoImpl.dart' as _i11;
import '../data/repository/exams/ExamsRepoImpl.dart' as _i15;
import '../domain/repository/AuthRepository.dart' as _i10;
import '../domain/repository/ExamsRepository.dart' as _i14;
import '../domain/usecase/AllSubjectsUseCase.dart' as _i17;
import '../domain/usecase/ForgetPasswordUseCase.dart' as _i16;
import '../domain/usecase/LoginUseCase.dart' as _i18;
import '../domain/usecase/RegisterUseCase.dart' as _i20;
import '../presentation/Exams/Subjects/SubjectsViewModel.dart' as _i22;
import '../presentation/ForgetPassword/ForgetPasswordViewModel.dart' as _i23;
import '../presentation/login/LoginViewModel.dart' as _i19;
import '../presentation/register/RegisterViewModel.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkMedule = _$NetworkMedule();
    final tokenProvider = _$TokenProvider();
    gh.singleton<_i3.AppConfigProvider>(() => _i3.AppConfigProvider());
    gh.factory<_i4.AuthOfflineDatasource>(
        () => _i5.AuthOfflineDatasourceImpl());
    gh.lazySingleton<_i6.Dio>(() => networkMedule.provideDio());
    await gh.factoryAsync<String>(
      () => tokenProvider.getToken(),
      preResolve: true,
    );
    gh.singleton<_i7.ApiManager>(() => _i7.ApiManager(gh<_i6.Dio>()));
    gh.factory<_i8.AuthOnlineDatasource>(
        () => _i9.AuthOnlineDatasourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i10.AuthRepository>(() => _i11.AuthRepoImpl(
          gh<_i8.AuthOnlineDatasource>(),
          gh<_i4.AuthOfflineDatasource>(),
        ));
    gh.factory<_i12.ExamsOnlineDataSource>(
        () => _i13.ExamsOnlineDataSourceImpl(gh<_i7.ApiManager>()));
    gh.factory<_i14.ExamsRepository>(
        () => _i15.ExamsRepositoryImpl(gh<_i12.ExamsOnlineDataSource>()));
    gh.factory<_i16.ForgetPasswordUsecase>(
        () => _i16.ForgetPasswordUsecase(gh<_i10.AuthRepository>()));
    gh.factory<_i17.GetAllSubjectsUseCase>(
        () => _i17.GetAllSubjectsUseCase(gh<_i14.ExamsRepository>()));
    gh.factory<_i18.LoginUseCase>(
        () => _i18.LoginUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i19.LoginViewModel>(() => _i19.LoginViewModel(
          gh<_i18.LoginUseCase>(),
          gh<_i3.AppConfigProvider>(),
        ));
    gh.factory<_i20.RegisterUseCase>(
        () => _i20.RegisterUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i21.RegisterViewModel>(
        () => _i21.RegisterViewModel(gh<_i20.RegisterUseCase>()));
    gh.factory<_i22.SubjectsViewModel>(() => _i22.SubjectsViewModel(
          gh<_i17.GetAllSubjectsUseCase>(),
          gh<_i3.AppConfigProvider>(),
        ));
    gh.factory<_i23.ForegetPasswordViewmodel>(
        () => _i23.ForegetPasswordViewmodel(gh<_i16.ForgetPasswordUsecase>()));
    return this;
  }
}

class _$NetworkMedule extends _i24.NetworkMedule {}

class _$TokenProvider extends _i25.TokenProvider {}
