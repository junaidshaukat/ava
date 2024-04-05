import 'package:flutter/material.dart';
import '/core/app_export.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.alignment,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    required super.text,
  });

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 32.v,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration ??
            CustomButtonStyles.gradientDeepOrangeToIndigoADecoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ?? theme.textTheme.labelMedium,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}

class OutlineButton extends StatelessWidget {
  final String text;
  final double strokeWidth;
  final EdgeInsets padding;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final Gradient? gradient;
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? label;
  final TextStyle? buttonTextStyle;
  final bool? isDisabled;
  final Alignment? alignment;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final ButtonStyle? buttonStyle;
  final void Function()? onPressed;

  const OutlineButton({
    super.key,
    required this.text,
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
              theme.colorScheme.primary.withOpacity(0)
            ],
          ),
      corners: Corners(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      child: CustomOutlinedButton(
        text: text,
        label: label,
        width: width,
        height: height,
        margin: margin,
        leftIcon: leftIcon,
        alignment: alignment,
        rightIcon: rightIcon,
        onPressed: onPressed,
        isDisabled: isDisabled,
        decoration: decoration,
        buttonTextStyle: buttonTextStyle,
        buttonStyle: buttonStyle ?? CustomButtonStyles.outline,
      ),
    );
  }
}
