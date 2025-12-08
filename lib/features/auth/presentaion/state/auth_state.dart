import 'dart:async';
import 'dart:developer';

import 'package:food_delivery/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:food_delivery/features/auth/domain/usecases/login_usecase.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/domain/auth_remote_data_source.dart';
import '../../data/datasources/local/auth_local_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/sign_in_with_email_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';

import 'package:flutter/widgets.dart';
import 'package:food_delivery/features/auth/data/models/user_login_dtos_model.dart';
import 'package:food_delivery/features/auth/data/models/user_sign_in_dtos_model.dart';

import '../../domain/entities/user_entity.dart';

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
SignInWithEmailUsecase signInWithEmailUsecase(Ref ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignInWithEmailUsecase(repo);
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
  AsyncValue<UserEntity> build() {
    // Initial state - don't call signIn automatically
    return AsyncValue.data(
      UserEntity(
        id: -1,
        firstName: '',
        pass: '',
        email: '',
        age: '',
        phoneNumber: '',
        profileImage: null,
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
      await ref.watch(getUserProvider.notifier).getUser(data.id);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Login State Notifier - Fixed version
@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  AsyncValue<UserEntity> build() {
    // Initial state - don't call signIn automatically
    return AsyncValue.data(
      UserEntity(
        id: -1,
        firstName: '',
        pass: '',
        email: '',
        age: '',
        phoneNumber: '',
        profileImage: null,
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
      log(data.phoneNumber, name: 'Login:-> auth_state');
      state = AsyncData(data);
      await ref.watch(getUserProvider.notifier).getUser(data.id);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void clear() {
    state = AsyncValue.data(
      UserEntity(
        id: -1,
        firstName: '',
        pass: '',
        email: '',
        age: '',
        phoneNumber: '',
        profileImage: null,
      ),
    );
  }
}

/// Get User State Notifier - Fixed version
@riverpod
class GetUserNotifier extends _$GetUserNotifier {
  GetUserNotifier() {
    call();
  }
  @override
  AsyncValue<UserEntity> build() {
    // Initial state - don't call signIn automatically
    return AsyncValue.data(
      UserEntity(
        id: -1,
        firstName: '',
        pass: '',
        email: '',
        age: '',
        phoneNumber: '',
        profileImage: null,
      ),
    );
  }

  void call() {
    unawaited(Future(() => getUser(0)));
  }

  /// Sign in method - called manually when user clicks the button
  Future<void> getUser(dynamic userId) async {
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
  Future<void> signOut(dynamic userId) async {
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

// @riverpod
// class SignInWithEmailNotifier extends _$SignInWithEmailNotifier {
//   @override
//   AsyncValue<UserEntity> build() {
//     // Initial state - don't call signIn automatically
//     return AsyncValue.data(
//       UserEntity(
//         id: -1,
//         firstName: '',
//         pass: '',
//         email: '',
//         age: '',
//         phoneNumber: '',
//         profileImage: null,
//       ),
//     );
//   }
//   /// Sign in method - called manually when user clicks the button
//   Future<void> signInWithEmail() async {
//     state = const AsyncLoading();
//     try {
//       final useCase = ref.read(loginWithEmailUsecaseProvider);
//       final data = await useCase();
//       log(data.user!.uid, name: 'loginWithEmail:-> auth_state');
//       final d = data.user!;
//       final userData = UserEntity(
//         id: d.uid,
//         firstName: d.displayName ?? '',
//         pass: '*******',
//         email: d.email ?? '',
//         age: '000',
//         phoneNumber: d.phoneNumber ?? '',
//         profileImage: d.photoURL,
//       );
//       state = AsyncData(userData);
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }

//   void clear() {
//     state = AsyncValue.data(
//       UserEntity(
//         id: -1,
//         firstName: '',
//         pass: '',
//         email: '',
//         age: '',
//         phoneNumber: '',
//         profileImage: null,
//       ),
//     );
//   }
// }
