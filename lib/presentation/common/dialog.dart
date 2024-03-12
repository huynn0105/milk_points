import 'package:flutter/material.dart';

import 'buttons.dart';
import 'colors.dart';
import 'images.dart';
import 'textstyle.dart';
import 'widget_layout.dart';

class DialogProvider {
  DialogProvider._();

  static final DialogProvider instance = DialogProvider._();
  bool expiredTokenIsShowing = false;

  Widget _mainDialog({
    Widget? child,
    Color? backgroundColor,
    EdgeInsets insetPadding = const EdgeInsets.all(16),
  }) {
    return Dialog(
      elevation: 0,
      insetPadding: insetPadding,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  showConfirmDialog(
    BuildContext context, {
    required String message,
    String? title,
    String positiveTitle = 'OK',
    String? negativeTitle,
    Function()? positiveCallback,
    Function()? negativeCallback,
    bool barrierDismissible = true,
  }) {
    if (expiredTokenIsShowing || message.isNotEmpty) return;
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: _mainDialog(
            child: WidgetLayout(
              child: ConfirmDialog(
                message: message,
                title: title,
                positiveTitle: positiveTitle,
                positiveCallback: positiveCallback,
                negativeTitle: negativeTitle,
                negativeCallback: negativeCallback,
              ),
            ),
          ),
        );
      },
    );
  }

  showErrorMsgDialog({
    required BuildContext context,
    String? message,
    String? title,
    required String btnTitle,
    Function()? callback,
    bool barrierDismissible = true,
  }) {
    if (title?.isNotEmpty != true && message?.isNotEmpty != true) return;
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: WidgetLayout(
            child: _mainDialog(
              child: ErrorMsgDialog(
                title: title,
                message: message,
                btnTitle: btnTitle,
                callback: callback,
              ),
            ),
          ),
        );
      },
    );
  }

  show({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: UIColors.blurBackground,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: WidgetLayout(
            child: _mainDialog(
              backgroundColor: Colors.transparent,
              child: child,
            ),
          ),
        );
      },
    );
  }

  showBuilder({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: UIColors.blurBackground,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: WidgetLayout(
            child: _mainDialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              child: builder(context),
            ),
          ),
        );
      },
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.message,
    this.title,
    this.positiveTitle = 'OK',
    this.positiveCallback,
    this.negativeTitle,
    this.negativeCallback,
  });

  final String message;
  final String? title;
  final String positiveTitle;
  final String? negativeTitle;
  final Function()? positiveCallback;
  final Function()? negativeCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Text(
                    title!,
                    style: UITextStyles.bold(20).copyWith(
                      color: UIColors.defaultText,
                    ),
                  ),
                ),
              Text(
                message,
                style: UITextStyles.regular(15).copyWith(
                  color: UIColors.defaultText,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Row(
          children: [
            if (negativeTitle != null)
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.of(context).pop();
                    negativeCallback?.call();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      negativeTitle!,
                      style: UITextStyles.regular(18).copyWith(
                        color: UIColors.defaultText,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.of(context).pop();
                  positiveCallback?.call();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    positiveTitle,
                    style: UITextStyles.medium(18).copyWith(
                      color: UIColors.defaultText,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ErrorMsgDialog extends StatelessWidget {
  const ErrorMsgDialog({
    super.key,
    this.title,
    this.message,
    required this.btnTitle,
    this.callback,
  });

  final String? title;
  final String? message;
  final String btnTitle;
  final Function? callback;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 343,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 20),
              child: Column(
                children: [
                  const AppImage.asset(
                    asset: "ic_error",
                    width: 56,
                    height: 56,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (title != null)
                    Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: UITextStyles.bold(16).copyWith(
                        color: UIColors.red,
                      ),
                    ),
                  if (title != null && message != null)
                    const SizedBox(
                      height: 12,
                    ),
                  if (message != null)
                    Text(
                      message!,
                      textAlign: TextAlign.center,
                      style: UITextStyles.regular(14).copyWith(
                        color: UIColors.grayText,
                      ),
                    ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            SplashButton(
              onTap: () {
                callback?.call();
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 17, top: 13),
                color: UIColors.lightBlue,
                child: Text(
                  btnTitle,
                  style: UITextStyles.bold(14).copyWith(
                    color: UIColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
