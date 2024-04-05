import 'package:flutter/material.dart';
import '/core/app_export.dart';

class DropdownModel {
  int? id;
  String title;
  dynamic value;
  bool isSelected;

  DropdownModel({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false,
  });
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.alignment,
    this.width,
    this.focusNode,
    this.icon,
    this.autofocus = false,
    this.textStyle,
    this.items,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
  });

  final Alignment? alignment;

  final double? width;

  final FocusNode? focusNode;

  final Widget? icon;

  final bool? autofocus;

  final TextStyle? textStyle;

  final List<DropdownModel>? items;

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

  final FormFieldValidator<DropdownModel>? validator;

  final Function(DropdownModel)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: dropDownWidget,
          )
        : dropDownWidget;
  }

  Widget get dropDownWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: DropdownButtonFormField<DropdownModel>(
          focusNode: focusNode ?? FocusNode(),
          icon: icon,
          autofocus: autofocus!,
          style: textStyle ?? CustomTextStyles.bodyMedium13,
          items: items?.map((DropdownModel item) {
            return DropdownMenuItem<DropdownModel>(
              value: item,
              child: Text(
                item.title,
                overflow: TextOverflow.ellipsis,
                style: hintStyle ?? CustomTextStyles.bodyMedium13,
              ),
            );
          }).toList(),
          decoration: decoration,
          validator: validator,
          onChanged: (value) {
            onChanged!(value!);
          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyMedium13,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(
              left: 13.h,
              top: 17.v,
              bottom: 17.v,
            ),
        // fillColor: fillColor ?? appTheme.gray3007f,
        //  filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.h),
              borderSide: BorderSide(
                color: theme.colorScheme.onError,
                width: 1.h,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.h),
              borderSide: BorderSide(
                color: theme.colorScheme.onError,
                width: 1.h,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.h),
              borderSide: BorderSide(
                color: theme.colorScheme.onError,
                width: 1.h,
              ),
            ),
      );
}

class SimpleDropDown extends StatelessWidget {
  const SimpleDropDown({
    super.key,
    required this.label,
    required this.hintText,
    this.items,
    this.onChanged,
    this.padding,
    this.mainPadding,
    this.hintStyle,
    this.isExpanded = true,
    this.borderColor,
    this.borderRadius,
  });

  final String label;
  final String hintText;
  final bool isExpanded;
  final BorderRadiusGeometry? borderRadius;
  final List<DropdownModel>? items;
  final EdgeInsetsGeometry? padding, mainPadding;
  final TextStyle? hintStyle;
  final Color? borderColor;

  final void Function(DropdownModel?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: mainPadding ?? EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: CustomTextStyles.bodyMedium13,
          ),
          SizedBox(height: 7.v),
          Container(
            padding: padding ?? EdgeInsets.symmetric(horizontal: 16.h),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? appTheme.blueGray300),
              borderRadius: borderRadius ?? BorderRadius.circular(4),
            ),
            child: DropdownButton(
              isExpanded: isExpanded,
              underline: const SizedBox.shrink(),
              hint: Text(
                hintText,
                overflow: TextOverflow.ellipsis,
                style: hintStyle ?? CustomTextStyles.bodyMedium13,
              ),
              items: items?.map((DropdownModel item) {
                return DropdownMenuItem<DropdownModel>(
                  value: item,
                  child: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: hintStyle ?? CustomTextStyles.bodyMedium13,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
