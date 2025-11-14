import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/sign_in_usecase.dart';

/// Repository provider
final repstoryProvider = Provider<AuthRepositoryImpl>(
  (ref) => AuthRepositoryImpl(client: http.Client()),
);

/// UseCase provider
final signInUsecaseProvider = Provider<SignInUsecase>((ref) {
  final repo = ref.watch(repstoryProvider);
  return SignInUsecase(repo);
});
