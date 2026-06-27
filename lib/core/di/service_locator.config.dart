// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/auth_firebase_remote_data_source.dart'
    as _i825;
import '../../features/auth/data/data_source/auth_remote_data_source.dart'
    as _i182;
import '../../features/auth/data/repository_impl/auth_repository_impl.dart'
    as _i954;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_cases/add_user_to_firestore_use_case.dart'
    as _i431;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i182.AuthRemoteDataSource>(
      () => _i825.AuthFirebaseRemoteDataSource(),
    );
    gh.singleton<_i961.AuthRepository>(
      () => _i954.AuthRepositoryImpl(
        remoteDataSource: gh<_i182.AuthRemoteDataSource>(),
      ),
    );
    gh.singleton<_i431.AddUserToFirestoreUseCase>(
      () => _i431.AddUserToFirestoreUseCase(
        authRepository: gh<_i961.AuthRepository>(),
      ),
    );
    gh.singleton<_i1038.LoginUseCase>(
      () => _i1038.LoginUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.singleton<_i1010.RegisterUseCase>(
      () => _i1010.RegisterUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        registerUseCase: gh<_i1010.RegisterUseCase>(),
        loginUseCase: gh<_i1038.LoginUseCase>(),
        addUserToFirestoreUseCase: gh<_i431.AddUserToFirestoreUseCase>(),
      ),
    );
    return this;
  }
}
