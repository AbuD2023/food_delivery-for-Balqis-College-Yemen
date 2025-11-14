import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import 'auth_state.dart';

/// Text Editing Controller Providers
final firstNameControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final passControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

/// StateNotifier for loading state
class SignInNotifier extends StateNotifier<AsyncValue<User>> {
  final SignInUsecase useCase;
  final User user;

  SignInNotifier(this.useCase, this.user) : super(const AsyncLoading()) {
    signIn();
  }

  Future<void> signIn() async {
    state = AsyncLoading();
    try {
      final data = await useCase(user);

      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider for OrganicNotifier
final signInProvider = StateNotifierProvider<SignInNotifier, AsyncValue<User>>((
  ref,
) {
  final useCase = ref.watch(signInUsecaseProvider);
  final firstName = ref.watch(firstNameControllerProvider).text;
  final pass = ref.watch(passControllerProvider).text;
  return SignInNotifier(useCase, User(firstName: firstName, pass: pass));
});
