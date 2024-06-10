/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDataGen {
  const $AssetsDataGen();

  /// Directory path: assets/data/food
  $AssetsDataFoodGen get food => const $AssetsDataFoodGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon.svg
  String get icon => 'assets/icons/icon.svg';

  /// List of all assets
  List<String> get values => [icon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/logo-1024x1024.png
  AssetGenImage get logo1024x1024 =>
      const AssetGenImage('assets/images/logo-1024x1024.png');

  /// File path: assets/images/logo-512x512.png
  AssetGenImage get logo512x512 =>
      const AssetGenImage('assets/images/logo-512x512.png');

  /// File path: assets/images/splash-screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/splash-screen.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icon, logo1024x1024, logo512x512, splashScreen];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/ai_generating.json
  String get aiGenerating => 'assets/lottie/ai_generating.json';

  /// List of all assets
  List<String> get values => [aiGenerating];
}

class $AssetsDataFoodGen {
  const $AssetsDataFoodGen();

  /// File path: assets/data/food/de.json
  String get de => 'assets/data/food/de.json';

  /// File path: assets/data/food/en.json
  String get en => 'assets/data/food/en.json';

  /// File path: assets/data/food/es.json
  String get es => 'assets/data/food/es.json';

  /// File path: assets/data/food/tr.json
  String get tr => 'assets/data/food/tr.json';

  /// List of all assets
  List<String> get values => [de, en, es, tr];
}

class Assets {
  Assets._();

  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
