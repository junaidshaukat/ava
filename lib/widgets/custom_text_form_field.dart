import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
  });

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus!,
          style: textStyle ?? theme.textTheme.bodyMedium,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodyMedium,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(20.h),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide.none,
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outline => OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlineTL25 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.h),
        borderSide: BorderSide.none,
      );
}

class OutlineInput extends StatelessWidget {
  final bool? filled;
  final Widget? label;
  final double? width;
  final double? height;
  final double topLeft;
  final double topRight;
  final Color? fillColor;
  final String? hintText;
  final bool? isDisabled;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final double bottomLeft;
  final double bottomRight;
  final Gradient? gradient;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final double strokeWidth;
  final Alignment? alignment;
  final TextStyle? hintStyle;
  final ButtonStyle? buttonStyle;
  final BoxDecoration? decoration;
  final EdgeInsets? contentPadding;
  final TextStyle? buttonTextStyle;
  final void Function()? onPressed;
  final InputBorder? borderDecoration;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const OutlineInput({
    super.key,
    this.controller,
    this.hintText,
    this.strokeWidth = 1,
    this.padding = EdgeInsets.zero,
    this.buttonStyle,
    this.onPressed,
    this.topLeft = 25,
    this.topRight = 25,
    this.bottomLeft = 25,
    this.bottomRight = 25,
    this.gradient,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    this.buttonTextStyle,
    this.isDisabled,
    this.alignment,
    this.height,
    this.width,
    this.margin,
    this.hintStyle,
    this.textInputAction,
    this.validator,
    this.filled = true,
    this.borderDecoration,
    this.contentPadding,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlineGradientButton(
      padding: padding,
      strokeWidth: strokeWidth,
      gradient: gradient ??
          LinearGradient(
            begin: const Alignment(0.5, 0),
            end: const Alignment(0.5, 1),
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withOpacity(0),
            ],
          ),
      corners: Corners(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      child: CustomTextFormField(
        controller: controller,
        hintText: hintText,
        hintStyle: hintStyle ?? CustomTextStyles.bodyLargeBluegray300,
        textInputAction: textInputAction,
        validator: validator,
        filled: filled,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 15.v,
            ),
        borderDecoration: borderDecoration ?? TextFormFieldStyleHelper.outline,
        fillColor: fillColor ?? appTheme.indigo900.withOpacity(0.4),
      ),
    );
  }
}
