import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoreSvgPicture extends SvgPicture {
  CoreSvgPicture.asset(
    super.assetName, {
    super.key,
    super.matchTextDirection,
    super.bundle,
    super.package,
    super.width,
    super.height,
    super.fit = BoxFit.cover,
    super.alignment,
    super.allowDrawingOutsideViewBox,
    super.placeholderBuilder,
    super.semanticsLabel,
    super.excludeFromSemantics,
    super.clipBehavior,
    super.theme,
    super.colorFilter,
    super.color,
    super.colorBlendMode,
    super.cacheColorFilter,
  }) : super.asset();
}
