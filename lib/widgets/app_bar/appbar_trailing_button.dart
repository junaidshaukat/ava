import 'package:flutter/material.dart';
import '/core/app_export.dart';

class AppbarTrailingButton extends StatelessWidget {
  const AppbarTrailingButton({
    super.key,
    this.margin,
    this.onTap,
    required this.text,
  });

  final String text;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          width: 100.h,
          text: text,
          buttonStyle: CustomButtonStyles.none,
          decoration: CustomButtonStyles.gradientDeepOrangeToIndigoADecoration,
          onPressed: onTap,
        ),
      ),
    );
  }
}
