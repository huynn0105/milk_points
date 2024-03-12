
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final Widget? footer;
  final Widget? buttonAtBottom;
  final ScrollController? scrollController;

  const AppLayout({
    Key? key,
    required this.child,
    this.color,
    this.footer,
    this.padding,
    this.buttonAtBottom,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final EdgeInsets childMargin = kIsWeb
            ? EdgeInsets.symmetric(
                horizontal: constraints.maxWidth >= 1000
                    ? (constraints.maxWidth - 1000) / 2
                    : 0,
              )
            : EdgeInsets.zero;
        return Container(
          color: Colors.transparent,
          constraints: kIsWeb
              ? constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                )
              : null,
          width: kIsWeb ? double.infinity : null,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: color ?? UIColors.extraLightGray,
                  padding: padding ?? EdgeInsets.zero,
                  margin: childMargin,
                  child: child,
                ),
              ),
              if (kIsWeb)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: childMargin,
                          color: color ?? UIColors.extraLightGray,
                        ),
                      ),
                      if (buttonAtBottom != null)
                        Container(
                          color: color ?? UIColors.extraLightGray,
                          margin: childMargin,
                          child: buttonAtBottom,
                        ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: childMargin,
                        child: footer,
                      )
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
