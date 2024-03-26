import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'images.dart';
import 'textstyle.dart';

class UISearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final EdgeInsets? contentPadding;
  final TextAlign textAlign;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? inputBorder;
  final bool readOnly;
  final bool autofocus;

  const UISearchTextField({
    super.key,
    this.focusNode,
    this.controller,
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.contentPadding,
    this.textAlign = TextAlign.left,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.inputBorder,
    this.readOnly = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = inputBorder ??
        const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: UIColors.lightGray,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        );
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: textStyle ?? UITextStyles.regular(14),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onChanged: onChanged,
      readOnly: readOnly,
      autofocus: autofocus,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: hintTextStyle ??
            UITextStyles.regular(14).copyWith(
              color: UIColors.gray,
            ),
        filled: true,
        isDense: true,
        fillColor: UIColors.white,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 20,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10, right: 12),
          child: AppImage.asset(
            asset: "ic_search_outline",
            width: 20,
            height: 20,
          ),
        ),
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        border: border,
      ),
    );
  }
}

class UITextFieldOutline extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final EdgeInsets? contentPadding;
  final TextAlign textAlign;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? inputBorder;
  final bool readOnly;
  final Color fillColor;
  final int? maxLines;
  final String? title;
  final String? initialValue;

  const UITextFieldOutline({
    super.key,
    this.focusNode,
    this.controller,
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.contentPadding = const EdgeInsets.all(16),
    this.textAlign = TextAlign.left,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.inputBorder,
    this.readOnly = false,
    this.fillColor = UIColors.white,
    this.maxLines,
    this.title,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final border = inputBorder ??
        const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: UIColors.lightGray,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        );
    final textfield = TextFormField(
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      style: textStyle ?? UITextStyles.regular(16),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onChanged: onChanged,
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: hintTextStyle ??
            UITextStyles.regular(16).copyWith(
              color: UIColors.gray,
            ),
        filled: true,
        isDense: true,
        fillColor: fillColor,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        border: border,
      ),
      maxLines: maxLines,
    );
    if (title?.isNotEmpty == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: UITextStyles.regular(14),
          ),
          const SizedBox(height: 8),
          textfield,
        ],
      );
    }
    return textfield;
  }
}
