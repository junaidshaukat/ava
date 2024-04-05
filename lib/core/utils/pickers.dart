import 'dart:io';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class Pickers {
  static Future<File?> media({bool gallery = true}) {
    ImagePicker picker = ImagePicker();
    return picker.pickMedia().then((file) {
      if (file != null) {
        return File(file.path);
      } else {
        return null;
      }
    });
  }

  static Future<File?> file({bool gallery = true}) {
    ImagePicker picker = ImagePicker();
    return picker
        .pickImage(
            source: gallery == true ? ImageSource.gallery : ImageSource.camera)
        .then((file) {
      if (file != null) {
        return File(file.path);
      } else {
        return null;
      }
    });
  }

  static Future<DateTime?> date(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    bool Function(DateTime)? selectableDayPredicate,
    String? helpText,
    String? cancelText,
    String? confirmText,
    Locale? locale,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TextDirection? textDirection,
    Widget Function(BuildContext, Widget?)? builder,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
    TextInputType? keyboardType,
    Offset? anchorPoint,
    void Function(DatePickerEntryMode)? onDatePickerModeChange,
  }) {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2050),
      currentDate: currentDate,
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicate,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      locale: locale,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: appTheme.primary,
              onPrimary: appTheme.whiteA700,
              onSurface: appTheme.primary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 18.fSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
      initialDatePickerMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
      keyboardType: keyboardType,
      anchorPoint: anchorPoint,
      onDatePickerModeChange: onDatePickerModeChange,
    ).then((value) {
      return value;
    });
  }

  static Future<TimeOfDay?> time(
    BuildContext context, {
    TimeOfDay? initialTime,
    Widget Function(BuildContext, Widget?)? builder,
    bool useRootNavigator = true,
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
    String? cancelText,
    String? confirmText,
    String? helpText,
    String? errorInvalidText,
    String? hourLabelText,
    String? minuteLabelText,
    RouteSettings? routeSettings,
    void Function(TimePickerEntryMode)? onEntryModeChanged,
    Offset? anchorPoint,
    Orientation? orientation,
  }) {
    return showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      initialEntryMode: initialEntryMode,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      errorInvalidText: errorInvalidText,
      anchorPoint: anchorPoint,
      minuteLabelText: minuteLabelText,
      hourLabelText: hourLabelText,
      orientation: orientation,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: appTheme.primary,
              onPrimary: appTheme.whiteA700,
              onSurface: appTheme.primary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 18.fSize,
                ),
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
        );
      },
    ).then((value) {
      return value;
    });
  }
}
