/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/email_icon.png
  AssetGenImage get emailIcon =>
      const AssetGenImage('assets/icons/email_icon.png');

  /// File path: assets/icons/password_icon.png
  AssetGenImage get passwordIcon =>
      const AssetGenImage('assets/icons/password_icon.png');

  /// File path: assets/icons/phone_icon.png
  AssetGenImage get phoneIcon =>
      const AssetGenImage('assets/icons/phone_icon.png');

  /// File path: assets/icons/user_icon.png
  AssetGenImage get userIcon =>
      const AssetGenImage('assets/icons/user_icon.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [emailIcon, passwordIcon, phoneIcon, userIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/applogo.png
  AssetGenImage get applogo => const AssetGenImage('assets/images/applogo.png');

  /// File path: assets/images/backgroundImg.png
  AssetGenImage get backgroundImg =>
      const AssetGenImage('assets/images/backgroundImg.png');

  /// File path: assets/images/circle background.png
  AssetGenImage get circleBackground =>
      const AssetGenImage('assets/images/circle background.png');

  /// File path: assets/images/forgot_password.png
  AssetGenImage get forgotPassword =>
      const AssetGenImage('assets/images/forgot_password.png');

  /// File path: assets/images/login illustration .png
  AssetGenImage get loginIllustration =>
      const AssetGenImage('assets/images/login illustration .png');

  /// File path: assets/images/otp_image.png
  AssetGenImage get otpImage =>
      const AssetGenImage('assets/images/otp_image.png');

  /// File path: assets/images/passwod.jpg
  AssetGenImage get passwod => const AssetGenImage('assets/images/passwod.jpg');

  /// File path: assets/images/signup illustration .png
  AssetGenImage get signupIllustration =>
      const AssetGenImage('assets/images/signup illustration .png');

  /// File path: assets/images/success.png
  AssetGenImage get success => const AssetGenImage('assets/images/success.png');

  /// File path: assets/images/welcome screen one.jpg
  AssetGenImage get welcomeScreenOne =>
      const AssetGenImage('assets/images/welcome screen one.jpg');

  /// File path: assets/images/welcome screen three.jpg
  AssetGenImage get welcomeScreenThree =>
      const AssetGenImage('assets/images/welcome screen three.jpg');

  /// File path: assets/images/welcome screen two.jpg
  AssetGenImage get welcomeScreenTwo =>
      const AssetGenImage('assets/images/welcome screen two.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        applogo,
        backgroundImg,
        circleBackground,
        forgotPassword,
        loginIllustration,
        otpImage,
        passwod,
        signupIllustration,
        success,
        welcomeScreenOne,
        welcomeScreenThree,
        welcomeScreenTwo
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/facebook_icon.svg
  SvgGenImage get facebookIcon =>
      const SvgGenImage('assets/svg/facebook_icon.svg');

  /// File path: assets/svg/google_icon.svg
  SvgGenImage get googleIcon => const SvgGenImage('assets/svg/google_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [facebookIcon, googleIcon];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
