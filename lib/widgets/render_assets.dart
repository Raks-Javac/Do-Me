import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BWidgetsRenderSvg extends StatelessWidget {
  final String svgPath;
  final Color? color;
  final double? height;

  const BWidgetsRenderSvg(
      {super.key, required this.svgPath, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    if (color == null) {
      return SvgPicture.asset(
        svgPath,
      );
    } else {
      return SvgPicture.asset(
        svgPath,

        // ignore: deprecated_member_use
        color: color,
      );
    }
  }
}

class BWidgetsRenderSvgWithHeightWidth extends StatelessWidget {
  final String svgPath;
  final Color? color;
  final double? height;
  final double? width;

  const BWidgetsRenderSvgWithHeightWidth(
      {super.key, required this.svgPath, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: height,
      color: color,
      width: width,
    );
  }
}

//image path

class BWidgetsRenderAssetImage extends StatelessWidget {
  final String imagePath;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final bool isAsset;

  const BWidgetsRenderAssetImage(
      {super.key,
      required this.imagePath,
      this.fit,
      this.width,
      this.height,
      required this.isAsset});

  @override
  Widget build(BuildContext context) {
    if (width != null && height != null) {
      return Image.asset(
        imagePath,
        fit: fit ?? BoxFit.cover,
      );
    } else {
      return Image.asset(
        imagePath,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      );
    }
  }
}
