import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WidgetLayout extends StatelessWidget {
  final Widget child;
  final Color? color;

  const WidgetLayout({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final EdgeInsets childMargin = kIsWeb
            ? EdgeInsets.symmetric(
                horizontal: constraints.maxWidth >= 1000
                    ? (constraints.maxWidth - 1000) / 2
                    : 20,
              )
            : EdgeInsets.zero;
        return Container(
          color: color,
          padding: childMargin,
          child: child,
        );
      },
    );
  }
}
