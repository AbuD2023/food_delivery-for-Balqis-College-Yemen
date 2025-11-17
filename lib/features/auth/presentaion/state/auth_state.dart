import 'package:food_delivery/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:food_delivery/features/auth/domain/usecases/login_usecase.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/domain/auth_remote_data_source.dart';
import '../../data/datasources/local/auth_local_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/sign_in_usecase.dart';

part 'auth_state.g.dart';

// Data Source Providers
@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSourceImpl();
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSourceImpl(client: http.Client());
}

/// Repository provider
@riverpod
AuthRepositoryImpl authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
}

/// UseCase provider
@riverpod
SignInUsecase signInUsecase(Ref ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignInUsecase(repo);
}

@riverpod
LoginUsecase loginUsecase(Ref ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginUsecase(repo);
}

@riverpod
GetUserUsecase getUserUsecase(Ref ref) {
  final repo = ref.watch(authRepositoryProvider);
  return GetUserUsecase(repo);
}

@riverpod
SignOutUsecase signOutUsecase(Ref ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignOutUsecase(repo);
}
