import 'package:flutter/material.dart';
import '/core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBluegray300 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray300,
      );
  static get bodyLargeUrbanistPurple100 =>
      theme.textTheme.bodyLarge!.urbanist.copyWith(
        color: appTheme.purple100,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 13.fSize,
      );
  static get bodyMediumPurple10001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.purple10001,
        fontSize: 13.fSize,
      );
  static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 10.fSize,
      );
  // Inter text style
  static get interPrimary => TextStyle(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 6.fSize,
        fontWeight: FontWeight.w400,
      ).inter;
  // Label text style
  static get labelLarge13 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 13.fSize,
      );
  static get labelLargeDeeppurple50 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.deepPurple50.withOpacity(0.4),
      );
  static get labelLargeDeeppurple50_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.deepPurple50,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get urbanist {
    return copyWith(
      fontFamily: 'Urbanist',
    );
  }
}
