import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/sign_in_usecase.dart';

part 'auth_state.g.dart';

/// Repository provider
@riverpod
AuthRepositoryImpl authRepository(Ref ref) {
  return AuthRepositoryImpl(client: http.Client());
}

/// UseCase provider
@riverpod
SignInUsecase signInUsecase(Ref ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignInUsecase(repo);
}
