/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart' as _lottie;

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/splash_animation.json
  LottieGenImage get splashAnimation => const LottieGenImage('assets/animations/splash_animation.json');

  /// List of all assets
  List<LottieGenImage> get values => [splashAnimation];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/logo
  $AssetsImagesLogoGen get logo => const $AssetsImagesLogoGen();

  /// Directory path: assets/images/onboarding
  $AssetsImagesOnboardingGen get onboarding => const $AssetsImagesOnboardingGen();
}

class $AssetsImagesLogoGen {
  const $AssetsImagesLogoGen();

  /// File path: assets/images/logo/appLogo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/images/logo/appLogo.png');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/intro1.jpg
  AssetGenImage get intro1 => const AssetGenImage('assets/images/onboarding/intro1.jpg');

  /// File path: assets/images/onboarding/intro2.jpg
  AssetGenImage get intro2 => const AssetGenImage('assets/images/onboarding/intro2.jpg');

  /// File path: assets/images/onboarding/intro3.jpg
  AssetGenImage get intro3 => const AssetGenImage('assets/images/onboarding/intro3.jpg');

  /// File path: assets/images/onboarding/intro_image1.jpg
  AssetGenImage get introImage1 => const AssetGenImage('assets/images/onboarding/intro_image1.jpg');

  /// File path: assets/images/onboarding/intro_image2.jpg
  AssetGenImage get introImage2 => const AssetGenImage('assets/images/onboarding/intro_image2.jpg');

  /// File path: assets/images/onboarding/intro_image3.jpg
  AssetGenImage get introImage3 => const AssetGenImage('assets/images/onboarding/intro_image3.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [intro1, intro2, intro3, introImage1, introImage2, introImage3];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({Key? key, AssetBundle? bundle, ImageFrameBuilder? frameBuilder, ImageErrorWidgetBuilder? errorBuilder, String? semanticLabel, bool excludeFromSemantics = false, double? scale, double? width, double? height, Color? color, Animation<double>? opacity, BlendMode? colorBlendMode, BoxFit? fit, AlignmentGeometry alignment = Alignment.center, ImageRepeat repeat = ImageRepeat.noRepeat, Rect? centerSlice, bool matchTextDirection = false, bool gaplessPlayback = true, bool isAntiAlias = false, String? package, FilterQuality filterQuality = FilterQuality.medium, int? cacheWidth, int? cacheHeight}) {
    return Image.asset(_assetName, key: key, bundle: bundle, frameBuilder: frameBuilder, errorBuilder: errorBuilder, semanticLabel: semanticLabel, excludeFromSemantics: excludeFromSemantics, scale: scale, width: width, height: height, color: color, opacity: opacity, colorBlendMode: colorBlendMode, fit: fit, alignment: alignment, repeat: repeat, centerSlice: centerSlice, matchTextDirection: matchTextDirection, gaplessPlayback: gaplessPlayback, isAntiAlias: isAntiAlias, package: package, filterQuality: filterQuality, cacheWidth: cacheWidth, cacheHeight: cacheHeight);
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({Animation<double>? controller, bool? animate, _lottie.FrameRate? frameRate, bool? repeat, bool? reverse, _lottie.LottieDelegates? delegates, _lottie.LottieOptions? options, void Function(_lottie.LottieComposition)? onLoaded, _lottie.LottieImageProviderFactory? imageProviderFactory, Key? key, AssetBundle? bundle, Widget Function(BuildContext, Widget, _lottie.LottieComposition?)? frameBuilder, ImageErrorWidgetBuilder? errorBuilder, double? width, double? height, BoxFit? fit, AlignmentGeometry? alignment, String? package, bool? addRepaintBoundary, FilterQuality? filterQuality, void Function(String)? onWarning, _lottie.LottieDecoder? decoder, _lottie.RenderCache? renderCache, bool? backgroundLoading}) {
    return _lottie.Lottie.asset(_assetName, controller: controller, animate: animate, frameRate: frameRate, repeat: repeat, reverse: reverse, delegates: delegates, options: options, onLoaded: onLoaded, imageProviderFactory: imageProviderFactory, key: key, bundle: bundle, frameBuilder: frameBuilder, errorBuilder: errorBuilder, width: width, height: height, fit: fit, alignment: alignment, package: package, addRepaintBoundary: addRepaintBoundary, filterQuality: filterQuality, onWarning: onWarning, decoder: decoder, renderCache: renderCache, backgroundLoading: backgroundLoading);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
