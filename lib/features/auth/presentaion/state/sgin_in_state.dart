import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/user.dart';
import 'auth_state.dart';

part 'sgin_in_state.g.dart';

/// Text Editing Controller Providers with proper disposal
@riverpod
class FirstNameController extends _$FirstNameController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

@riverpod
class PassController extends _$PassController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

/// Sign In State Notifier - Fixed version
@riverpod
class SignInNotifier extends _$SignInNotifier {
  @override
  AsyncValue<User> build() {
    // Initial state - don't call signIn automatically
    return AsyncValue.data(User(firstName: '', pass: ''));
  }

  /// Sign in method - called manually when user clicks the button
  Future<void> signIn(String firstName, String password) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(signInUsecaseProvider);
      final user = User(firstName: firstName, pass: password);
      final data = await useCase(user);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
