import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'textstyle.dart';

Widget _defaultLoadingWidget = const SizedBox(
  width: 20,
  height: 20,
  child: RepaintBoundary(
    child: CircularProgressIndicator(
      color: Colors.white,
      strokeWidth: 3.5,
    ),
  ),
);

class _RenderButton extends StatelessWidget {
  _RenderButton({
    super.key,
    this.title,
    this.widget,
    required this.onPressed,
    this.enabled = true,
    this.buttonColor,
    this.textColor = UIColors.white,
    this.padding = const EdgeInsets.all(13),
    this.isLoading = false,
    this.height,
    this.width,
    this.radius = 6,
    this.elevation,
  });
  final String? title;
  final Widget? widget;
  final bool enabled;
  final void Function() onPressed;
  final Color? buttonColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final bool isLoading;
  final double? height;
  final double? width;
  final double radius;
  final double? elevation;

  late final Widget button = MaterialButton(
    onPressed: enabled
        ? () {
            if (!isLoading) {
              onPressed();
            }
          }
        : null,
    padding: padding,
    color: buttonColor ?? UIColors.primaryColor,
    disabledColor: UIColors.gray,
    splashColor: enabled ? null : Colors.transparent,
    highlightColor: enabled ? null : Colors.transparent,
    elevation: elevation ?? 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    child: isLoading
        ? _defaultLoadingWidget
        : widget ??
            Text(
              title ?? "",
              textAlign: TextAlign.center,
              style: UITextStyles.medium(16).copyWith(
                color: enabled ? textColor : UIColors.grayText,
                height: 1,
              ),
            ),
  );

  @override
  Widget build(BuildContext context) {
    if (height == null) {
      return SizedBox(
        width: width,
        child: button,
      );
    }
    return SizedBox(height: height, width: width, child: button);
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.title,
    this.widget,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    this.buttonColor = UIColors.primaryColor,
    this.textColor = UIColors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.height = 45,
    this.width,
    this.radius = 8,
    this.elevation,
  });

  final String? title;
  final Widget? widget;
  final bool enabled;
  final void Function() onPressed;
  final Color? buttonColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final bool isLoading;
  final double height;
  final double? width;
  final double radius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return _RenderButton(
      title: title,
      widget: widget,
      onPressed: onPressed,
      enabled: enabled,
      buttonColor: buttonColor,
      textColor: textColor,
      padding: padding,
      isLoading: isLoading,
      height: height,
      width: width,
      radius: radius,
      elevation: elevation,
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    this.title = '',
    this.child,
    required this.onPressed,
    this.enabled = true,
    this.borderColor = UIColors.gray,
    this.disabledBorderColor = UIColors.gray,
    this.textColor = UIColors.defaultText,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.backgroundColor = Colors.white,
    this.splashColor = Colors.white24,
    this.height = 50,
    this.borderRadius,
    this.isLoading = false,
    this.borderWidth = 2,
  });

  final String title;
  final Widget? child;
  final bool enabled;
  final void Function() onPressed;
  final Color borderColor;
  final Color disabledBorderColor;
  final Color textColor;
  final Color backgroundColor;
  final Color splashColor;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final double height;
  final bool isLoading;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled
          ? () {
              if (!isLoading) {
                onPressed.call();
              }
            }
          : null,
      style: OutlinedButton.styleFrom(
        foregroundColor: splashColor,
        backgroundColor: backgroundColor,
        padding: padding,
        side: BorderSide(
          width: borderWidth,
          color: enabled ? borderColor : disabledBorderColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(6),
        ),
        fixedSize: Size.fromHeight(height),
      ),
      child: isLoading
          ? const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: UIColors.primaryColor,
                    strokeWidth: 3.5,
                  ),
                )
              ],
            )
          : child ??
              Text(
                title,
                style: UITextStyles.medium(16).copyWith(color: textColor, height: 1),
              ),
    );
  }
}

class SplashButton extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final Color highlightColor;
  final Color hoverColor;
  final GestureTapCallback? onTap;
  final bool isDisabled;

  const SplashButton({
    super.key,
    required this.child,
    this.borderRadius,
    this.highlightColor = Colors.white54,
    this.hoverColor = Colors.white54,
    this.isDisabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isDisabled) return child;

    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            borderRadius: borderRadius,
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: highlightColor,
              hoverColor: hoverColor,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}

//without hover?
class AppSplashButton extends CupertinoButton {
  const AppSplashButton({
    super.key,
    required super.child,
    required VoidCallback? onTap,
    double super.minSize = 20.0,
    bool isDisable = false,
    Color splashColor = Colors.white30,
    EdgeInsets super.padding = EdgeInsets.zero,
    super.borderRadius = null,
    super.pressedOpacity = 0.5,
  }) : super(
          onPressed: isDisable ? null : onTap,
        );
}
