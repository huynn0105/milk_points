import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'colors.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    this.height,
    this.baseColor = UIColors.backgroundColor,
    this.highlightColor = UIColors.gray,
    required this.child,
  });

  final double? height;
  final Color baseColor;
  final Color highlightColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        enabled: true,
        period: const Duration(milliseconds: 3000),
        child: child,
      ),
    );
  }
}
