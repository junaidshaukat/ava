import 'package:flutter/material.dart';
import '/core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Gradient button style
  static BoxDecoration get gradientDeepOrangeToIndigoADecoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        gradient: LinearGradient(
          begin: const Alignment(1.0, 0),
          end: const Alignment(-0.25, 0),
          colors: [
            appTheme.deepOrange300,
            appTheme.indigoA200,
          ],
        ),
      );
  static BoxDecoration get gradientDeepOrangeToIndigoADecoration2 =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        gradient: const LinearGradient(
          begin: Alignment(1.0, 0),
          end: Alignment(-0.25, 0),
          colors: [
            Color(0xFFF29F60),
            Color(0xFFEA5F7E),
            Color(0xFF6F67EA),
          ],
        ),
      );

  static BoxDecoration get gradientDeepOrangeToIndigoATL9Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(9.h),
        gradient: LinearGradient(
          begin: const Alignment(1.0, 0),
          end: const Alignment(-0.25, 0),
          colors: [
            appTheme.deepOrange300,
            appTheme.indigoA200,
          ],
        ),
      );
  static BoxDecoration get gradientPurpleToPurpleDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(25.h),
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            appTheme.purple10001.withOpacity(0.09),
            appTheme.purple10016,
          ],
        ),
      );
  static BoxDecoration get gradientPurpleToPurpleTL16Decoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            appTheme.purple10001.withOpacity(0.09),
            appTheme.purple10016,
          ],
        ),
      );

  // Outline button style
  static ButtonStyle get outline => OutlinedButton.styleFrom(
        backgroundColor: appTheme.indigo900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.h),
        ),
      );
  static ButtonStyle get outlineTL25 => OutlinedButton.styleFrom(
        backgroundColor: appTheme.indigo900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.h),
        ),
      );
  static ButtonStyle get outlineTL251 => OutlinedButton.styleFrom(
        backgroundColor: appTheme.indigo900.withOpacity(0.49),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
