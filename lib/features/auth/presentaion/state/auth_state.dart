import 'dart:developer';

import 'package:food_delivery/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:food_delivery/features/auth/domain/usecases/login_usecase.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/domain/auth_remote_data_source.dart';
import '../../data/datasources/local/auth_local_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/sign_in_usecase.dart';

import 'package:flutter/widgets.dart';
import 'package:food_delivery/features/auth/data/models/user_login_dtos_model.dart';
import 'package:food_delivery/features/auth/data/models/user_sign_in_dtos_model.dart';

import '../../domain/entities/user.dart';

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
class ObscureTextController extends _$ObscureTextController {
  @override
  bool build() => true;
  void toggle() => state = !state;
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
      log(data.phoneNumber, name: 'Login:-> aurh_state');
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void clear() {
    state = AsyncValue.data(
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
