// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authLocalDataSource)
const authLocalDataSourceProvider = AuthLocalDataSourceProvider._();

final class AuthLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AuthLocalDataSource,
          AuthLocalDataSource,
          AuthLocalDataSource
        >
    with $Provider<AuthLocalDataSource> {
  const AuthLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthLocalDataSource create(Ref ref) {
    return authLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthLocalDataSource>(value),
    );
  }
}

String _$authLocalDataSourceHash() =>
    r'f28d447c0de8bc28b70a84c9bea5a099791a93ba';

@ProviderFor(authRemoteDataSource)
const authRemoteDataSourceProvider = AuthRemoteDataSourceProvider._();

final class AuthRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AuthRemoteDataSource,
          AuthRemoteDataSource,
          AuthRemoteDataSource
        >
    with $Provider<AuthRemoteDataSource> {
  const AuthRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRemoteDataSource create(Ref ref) {
    return authRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDataSource>(value),
    );
  }
}

String _$authRemoteDataSourceHash() =>
    r'f1e7ea7993b066121193e7dab91cf380b97195a0';

/// Repository provider

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

/// Repository provider

final class AuthRepositoryProvider
    extends
        $FunctionalProvider<
          AuthRepositoryImpl,
          AuthRepositoryImpl,
          AuthRepositoryImpl
        >
    with $Provider<AuthRepositoryImpl> {
  /// Repository provider
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRepositoryImpl create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepositoryImpl>(value),
    );
  }
}

String _$authRepositoryHash() => r'd85cdd6d964b8b5f1e5489d1da8ca65fa31ab5e8';

/// UseCase provider

@ProviderFor(signInUsecase)
const signInUsecaseProvider = SignInUsecaseProvider._();

/// UseCase provider

final class SignInUsecaseProvider
    extends $FunctionalProvider<SignInUsecase, SignInUsecase, SignInUsecase>
    with $Provider<SignInUsecase> {
  /// UseCase provider
  const SignInUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInUsecaseHash();

  @$internal
  @override
  $ProviderElement<SignInUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignInUsecase create(Ref ref) {
    return signInUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInUsecase>(value),
    );
  }
}

String _$signInUsecaseHash() => r'5014b6234cc8bab4d3c5ebbbc7d4bbe4f9bf2951';

@ProviderFor(loginUsecase)
const loginUsecaseProvider = LoginUsecaseProvider._();

final class LoginUsecaseProvider
    extends $FunctionalProvider<LoginUsecase, LoginUsecase, LoginUsecase>
    with $Provider<LoginUsecase> {
  const LoginUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUsecaseHash();

  @$internal
  @override
  $ProviderElement<LoginUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginUsecase create(Ref ref) {
    return loginUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUsecase>(value),
    );
  }
}

String _$loginUsecaseHash() => r'e4e2d90cb5db9c371285006973a60782351116ee';

@ProviderFor(signInWithEmailUsecase)
const signInWithEmailUsecaseProvider = SignInWithEmailUsecaseProvider._();

final class SignInWithEmailUsecaseProvider
    extends
        $FunctionalProvider<
          SignInWithEmailUsecase,
          SignInWithEmailUsecase,
          SignInWithEmailUsecase
        >
    with $Provider<SignInWithEmailUsecase> {
  const SignInWithEmailUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInWithEmailUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInWithEmailUsecaseHash();

  @$internal
  @override
  $ProviderElement<SignInWithEmailUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SignInWithEmailUsecase create(Ref ref) {
    return signInWithEmailUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInWithEmailUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInWithEmailUsecase>(value),
    );
  }
}

String _$signInWithEmailUsecaseHash() =>
    r'5d2dfcd4ab1adbccece36917b5e1caeb6d3b3699';

@ProviderFor(getUserUsecase)
const getUserUsecaseProvider = GetUserUsecaseProvider._();

final class GetUserUsecaseProvider
    extends $FunctionalProvider<GetUserUsecase, GetUserUsecase, GetUserUsecase>
    with $Provider<GetUserUsecase> {
  const GetUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetUserUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUserUsecase create(Ref ref) {
    return getUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUserUsecase>(value),
    );
  }
}

String _$getUserUsecaseHash() => r'571e950afe75428289e538ac0d2bc5272f1021bd';

@ProviderFor(signOutUsecase)
const signOutUsecaseProvider = SignOutUsecaseProvider._();

final class SignOutUsecaseProvider
    extends $FunctionalProvider<SignOutUsecase, SignOutUsecase, SignOutUsecase>
    with $Provider<SignOutUsecase> {
  const SignOutUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signOutUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signOutUsecaseHash();

  @$internal
  @override
  $ProviderElement<SignOutUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignOutUsecase create(Ref ref) {
    return signOutUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignOutUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignOutUsecase>(value),
    );
  }
}

String _$signOutUsecaseHash() => r'288a7cdf56fcdb5af302660ee153f8107543e1bf';

/// Text Editing Controller Providers with proper disposal

@ProviderFor(FirstNameController)
const firstNameControllerProvider = FirstNameControllerProvider._();

/// Text Editing Controller Providers with proper disposal
final class FirstNameControllerProvider
    extends $NotifierProvider<FirstNameController, TextEditingController> {
  /// Text Editing Controller Providers with proper disposal
  const FirstNameControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firstNameControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firstNameControllerHash();

  @$internal
  @override
  FirstNameController create() => FirstNameController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$firstNameControllerHash() =>
    r'233c527d9ae3d443ae531335cffed6d164b587bf';

/// Text Editing Controller Providers with proper disposal

abstract class _$FirstNameController extends $Notifier<TextEditingController> {
  TextEditingController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TextEditingController, TextEditingController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextEditingController, TextEditingController>,
              TextEditingController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(PassController)
const passControllerProvider = PassControllerProvider._();

final class PassControllerProvider
    extends $NotifierProvider<PassController, TextEditingController> {
  const PassControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passControllerHash();

  @$internal
  @override
  PassController create() => PassController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$passControllerHash() => r'6ce9cb4d8f98483ea56ea95dabcddb103981c66b';

abstract class _$PassController extends $Notifier<TextEditingController> {
  TextEditingController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TextEditingController, TextEditingController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextEditingController, TextEditingController>,
              TextEditingController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ObscureTextController)
const obscureTextControllerProvider = ObscureTextControllerProvider._();

final class ObscureTextControllerProvider
    extends $NotifierProvider<ObscureTextController, bool> {
  const ObscureTextControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'obscureTextControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$obscureTextControllerHash();

  @$internal
  @override
  ObscureTextController create() => ObscureTextController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$obscureTextControllerHash() =>
    r'b67d5fd59837e8fe040f03dde547eab957aab6fc';

abstract class _$ObscureTextController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(EmailController)
const emailControllerProvider = EmailControllerProvider._();

final class EmailControllerProvider
    extends $NotifierProvider<EmailController, TextEditingController> {
  const EmailControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emailControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emailControllerHash();

  @$internal
  @override
  EmailController create() => EmailController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$emailControllerHash() => r'27b97914ccd7d4b0d8797ddde889cc916bc96401';

abstract class _$EmailController extends $Notifier<TextEditingController> {
  TextEditingController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TextEditingController, TextEditingController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextEditingController, TextEditingController>,
              TextEditingController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AgeController)
const ageControllerProvider = AgeControllerProvider._();

final class AgeControllerProvider
    extends $NotifierProvider<AgeController, TextEditingController> {
  const AgeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ageControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ageControllerHash();

  @$internal
  @override
  AgeController create() => AgeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$ageControllerHash() => r'9566eeec2224f600288465067d437b587498370a';

abstract class _$AgeController extends $Notifier<TextEditingController> {
  TextEditingController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TextEditingController, TextEditingController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextEditingController, TextEditingController>,
              TextEditingController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(PhoneNumberController)
const phoneNumberControllerProvider = PhoneNumberControllerProvider._();

final class PhoneNumberControllerProvider
    extends $NotifierProvider<PhoneNumberController, TextEditingController> {
  const PhoneNumberControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'phoneNumberControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$phoneNumberControllerHash();

  @$internal
  @override
  PhoneNumberController create() => PhoneNumberController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextEditingController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextEditingController>(value),
    );
  }
}

String _$phoneNumberControllerHash() =>
    r'85a5ed3cd8d0c6d97d36ae5c2d37519a62ab821b';

abstract class _$PhoneNumberController
    extends $Notifier<TextEditingController> {
  TextEditingController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TextEditingController, TextEditingController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextEditingController, TextEditingController>,
              TextEditingController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Sign In State Notifier - Fixed version

@ProviderFor(SignInNotifier)
const signInProvider = SignInNotifierProvider._();

/// Sign In State Notifier - Fixed version
final class SignInNotifierProvider
    extends $NotifierProvider<SignInNotifier, AsyncValue<UserEntity>> {
  /// Sign In State Notifier - Fixed version
  const SignInNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInNotifierHash();

  @$internal
  @override
  SignInNotifier create() => SignInNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<UserEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<UserEntity>>(value),
    );
  }
}

String _$signInNotifierHash() => r'38353e1723d9e56a597a263cc97e34160b3fcd28';

/// Sign In State Notifier - Fixed version

abstract class _$SignInNotifier extends $Notifier<AsyncValue<UserEntity>> {
  AsyncValue<UserEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<UserEntity>, AsyncValue<UserEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserEntity>, AsyncValue<UserEntity>>,
              AsyncValue<UserEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Login State Notifier - Fixed version

@ProviderFor(LoginNotifier)
const loginProvider = LoginNotifierProvider._();

/// Login State Notifier - Fixed version
final class LoginNotifierProvider
    extends $NotifierProvider<LoginNotifier, AsyncValue<UserEntity>> {
  /// Login State Notifier - Fixed version
  const LoginNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginNotifierHash();

  @$internal
  @override
  LoginNotifier create() => LoginNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<UserEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<UserEntity>>(value),
    );
  }
}

String _$loginNotifierHash() => r'86ebf47339d35a49a8d4e41ce6bc46765807c8ad';

/// Login State Notifier - Fixed version

abstract class _$LoginNotifier extends $Notifier<AsyncValue<UserEntity>> {
  AsyncValue<UserEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<UserEntity>, AsyncValue<UserEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserEntity>, AsyncValue<UserEntity>>,
              AsyncValue<UserEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Get User State Notifier - Fixed version

@ProviderFor(GetUserNotifier)
const getUserProvider = GetUserNotifierProvider._();

/// Get User State Notifier - Fixed version
final class GetUserNotifierProvider
    extends $NotifierProvider<GetUserNotifier, AsyncValue<UserEntity>> {
  /// Get User State Notifier - Fixed version
  const GetUserNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserNotifierHash();

  @$internal
  @override
  GetUserNotifier create() => GetUserNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<UserEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<UserEntity>>(value),
    );
  }
}

String _$getUserNotifierHash() => r'fcde44eca9a3b777ead0cf1f8bd9ab3a700c4444';

/// Get User State Notifier - Fixed version

abstract class _$GetUserNotifier extends $Notifier<AsyncValue<UserEntity>> {
  AsyncValue<UserEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<UserEntity>, AsyncValue<UserEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserEntity>, AsyncValue<UserEntity>>,
              AsyncValue<UserEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Sign Out User State Notifier - Fixed version

@ProviderFor(SignOutNotifier)
const signOutProvider = SignOutNotifierProvider._();

/// Sign Out User State Notifier - Fixed version
final class SignOutNotifierProvider
    extends $NotifierProvider<SignOutNotifier, AsyncValue<bool>> {
  /// Sign Out User State Notifier - Fixed version
  const SignOutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signOutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signOutNotifierHash();

  @$internal
  @override
  SignOutNotifier create() => SignOutNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<bool>>(value),
    );
  }
}

String _$signOutNotifierHash() => r'e648c040e12927db06f419e881c2703f213faa38';

/// Sign Out User State Notifier - Fixed version

abstract class _$SignOutNotifier extends $Notifier<AsyncValue<bool>> {
  AsyncValue<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, AsyncValue<bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, AsyncValue<bool>>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
