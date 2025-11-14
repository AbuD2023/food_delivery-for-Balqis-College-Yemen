// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sgin_in_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

/// Sign In State Notifier - Fixed version

@ProviderFor(SignInNotifier)
const signInProvider = SignInNotifierProvider._();

/// Sign In State Notifier - Fixed version
final class SignInNotifierProvider
    extends $NotifierProvider<SignInNotifier, AsyncValue<User>> {
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
  Override overrideWithValue(AsyncValue<User> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<User>>(value),
    );
  }
}

String _$signInNotifierHash() => r'c93065c3a0949c463c094abe17def5ebc17d0780';

/// Sign In State Notifier - Fixed version

abstract class _$SignInNotifier extends $Notifier<AsyncValue<User>> {
  AsyncValue<User> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<User>, AsyncValue<User>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User>, AsyncValue<User>>,
              AsyncValue<User>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
