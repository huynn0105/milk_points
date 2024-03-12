import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppImage extends StatelessWidget {
  const AppImage.asset({
    super.key,
    required this.asset,
    this.url,
    this.base64,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.alignment,
    this.cached = true,
    this.gaplessPlayback = false,
    this.errorBuilder,
  });

  const AppImage.base64({
    super.key,
    required this.base64,
    this.url,
    this.asset,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.alignment,
    this.cached = true,
    this.gaplessPlayback = false,
    this.errorBuilder,
  });


  /// Source
  final String? url;
  final String? base64;
  final String? asset;

  /// Properties
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final Color? color;
  final AlignmentGeometry? alignment;
  final bool cached;
  final bool gaplessPlayback;
  final Widget Function()? errorBuilder;

  @override
  Widget build(BuildContext context) {
    
    if (base64 != null) {
      return _buildBase64();
    }
    if (asset != null) {
      return _buildAsset();
    }
    return const SizedBox();
  }

  _buildAsset() {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        "assets/images/$asset.png",
        height: height,
        width: width,
        fit: fit,
        color: color,
        alignment: alignment ?? Alignment.center,
        errorBuilder: (_, __, ___) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: UIColors.gray,
              borderRadius: borderRadius,
            ),
          );
        },
      ),
    );
  }

  _buildBase64() {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.memory(
        base64Decode(base64!),
        height: height,
        width: width,
        fit: fit,
        color: color,
        gaplessPlayback: gaplessPlayback,
        errorBuilder: (_, __, ___) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: UIColors.gray,
              borderRadius: borderRadius,
            ),
          );
        },
      ),
    );
  }
}
