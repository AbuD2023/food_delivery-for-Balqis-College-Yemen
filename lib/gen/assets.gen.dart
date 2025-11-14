// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/BeingDelivered.png
  AssetGenImage get beingDelivered =>
      const AssetGenImage('assets/icons/BeingDelivered.png');

  /// File path: assets/icons/BeingPrepared.png
  AssetGenImage get beingPrepared =>
      const AssetGenImage('assets/icons/BeingPrepared.png');

  /// File path: assets/icons/CallDelivered.png
  AssetGenImage get callDelivered =>
      const AssetGenImage('assets/icons/CallDelivered.png');

  /// File path: assets/icons/Congratulations.png
  AssetGenImage get congratulations =>
      const AssetGenImage('assets/icons/Congratulations.png');

  /// File path: assets/icons/Logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/Logo.png');

  /// File path: assets/icons/Received.png
  AssetGenImage get received =>
      const AssetGenImage('assets/icons/Received.png');

  /// File path: assets/icons/Succses.png
  AssetGenImage get succses => const AssetGenImage('assets/icons/Succses.png');

  /// File path: assets/icons/Taken.png
  AssetGenImage get taken => const AssetGenImage('assets/icons/Taken.png');

  /// File path: assets/icons/drawer.png
  AssetGenImage get drawer => const AssetGenImage('assets/icons/drawer.png');

  /// File path: assets/icons/fa_shopping-basket.png
  AssetGenImage get faShoppingBasket =>
      const AssetGenImage('assets/icons/fa_shopping-basket.png');

  /// File path: assets/icons/list_sarch.png
  AssetGenImage get listSarch =>
      const AssetGenImage('assets/icons/list_sarch.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    beingDelivered,
    beingPrepared,
    callDelivered,
    congratulations,
    logo,
    received,
    succses,
    taken,
    drawer,
    faShoppingBasket,
    listSarch,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/food
  $AssetsImagesFoodGen get food => const $AssetsImagesFoodGen();

  /// Directory path: assets/images/map
  $AssetsImagesMapGen get map => const $AssetsImagesMapGen();

  /// Directory path: assets/images/splash
  $AssetsImagesSplashGen get splash => const $AssetsImagesSplashGen();
}

class $AssetsSoundGen {
  const $AssetsSoundGen();

  /// File path: assets/sound/failure.mp3
  String get failure => 'assets/sound/failure.mp3';

  /// File path: assets/sound/success.mp3
  String get success => 'assets/sound/success.mp3';

  /// List of all assets
  List<String> get values => [failure, success];
}

class $AssetsImagesFoodGen {
  const $AssetsImagesFoodGen();

  /// File path: assets/images/food/Berry mango combo.png
  AssetGenImage get berryMangoCombo =>
      const AssetGenImage('assets/images/food/Berry mango combo.png');

  /// File path: assets/images/food/Honey lime combo.png
  AssetGenImage get honeyLimeCombo =>
      const AssetGenImage('assets/images/food/Honey lime combo.png');

  /// File path: assets/images/food/Quinoa Fruit Salad.png
  AssetGenImage get quinoaFruitSalad =>
      const AssetGenImage('assets/images/food/Quinoa Fruit Salad.png');

  /// File path: assets/images/food/Tropical fruit salad.png
  AssetGenImage get tropicalFruitSalad =>
      const AssetGenImage('assets/images/food/Tropical fruit salad.png');

  /// File path: assets/images/food/melon fruit salad.png
  AssetGenImage get melonFruitSalad =>
      const AssetGenImage('assets/images/food/melon fruit salad.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    berryMangoCombo,
    honeyLimeCombo,
    quinoaFruitSalad,
    tropicalFruitSalad,
    melonFruitSalad,
  ];
}

class $AssetsImagesMapGen {
  const $AssetsImagesMapGen();

  /// File path: assets/images/map/Rectangle 45.png
  AssetGenImage get rectangle45 =>
      const AssetGenImage('assets/images/map/Rectangle 45.png');

  /// List of all assets
  List<AssetGenImage> get values => [rectangle45];
}

class $AssetsImagesSplashGen {
  const $AssetsImagesSplashGen();

  /// File path: assets/images/splash/Welcome1.png
  AssetGenImage get welcome1 =>
      const AssetGenImage('assets/images/splash/Welcome1.png');

  /// File path: assets/images/splash/Welcome2.png
  AssetGenImage get welcome2 =>
      const AssetGenImage('assets/images/splash/Welcome2.png');

  /// List of all assets
  List<AssetGenImage> get values => [welcome1, welcome2];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSoundGen sound = $AssetsSoundGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
