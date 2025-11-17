import 'package:flutter/widgets.dart';
import 'package:food_delivery/features/auth/data/models/user_login_dtos_model.dart';
import 'package:food_delivery/features/auth/data/models/user_sign_in_dtos_model.dart';
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

@riverpod
class EmailController extends _$EmailController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

@riverpod
class AgeController extends _$AgeController {
  @override
  TextEditingController build() {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  }
}

@riverpod
class PhoneNumberController extends _$PhoneNumberController {
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
    return AsyncValue.data(
      User(
        id: -1,
        firstName: '',
        pass: '',
        email: '',
        age: '',
        phoneNumber: '',
      ),
    );
  }

  /// Sign in method - called manually when user clicks the button
  Future<void> signIn(UserSignInDtosModel userSignInDtosModel) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(signInUsecaseProvider);
      final user = userSignInDtosModel;
      final data = await useCase(user);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Login State Notifier - Fixed version
@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  AsyncValue<User> build() {
    // Initial state - don't call signIn automatically
    return AsyncValue.data(
      User(
        id: -1,
        firstName: '',
        pass: '',
        email: '',
        age: '',
        phoneNumber: '',
      ),
    );
  }

  /// Sign in method - called manually when user clicks the button
  Future<void> login(UserLoginDtosModel userLoginDtosModel) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(loginUsecaseProvider);
      final user = userLoginDtosModel;
      final data = await useCase(user);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Get User State Notifier - Fixed version
@riverpod
class GetUserNotifier extends _$GetUserNotifier {
  @override
  AsyncValue<User> build() {
    // Initial state - don't call signIn automatically
    return AsyncValue.data(
      User(
        id: -1,
        firstName: '',
        pass: '',
        email: '',
        age: '',
        phoneNumber: '',
      ),
    );
  }

  /// Sign in method - called manually when user clicks the button
  Future<void> getUser(int userId) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(getUserUsecaseProvider);
      final data = await useCase(userId);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Sign Out User State Notifier - Fixed version
@riverpod
class SignOutNotifier extends _$SignOutNotifier {
  @override
  AsyncValue<bool> build() {
    // Initial state - don't call signIn automatically
    return AsyncValue.data(false);
  }

  /// Sign in method - called manually when user clicks the button
  Future<void> signOut(int userId) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(signOutUsecaseProvider);
      final data = await useCase(userId);
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
