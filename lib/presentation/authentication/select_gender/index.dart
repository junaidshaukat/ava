import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/model.dart';
export 'binding/binding.dart';
export 'controller/controller.dart';

class SelectGenderScreen extends StatelessWidget {
  final controller = Get.put(SelectGenderController());
  SelectGenderScreen({super.key});

  void onPressed() {}

  Widget card({
    String? imagePath,
    String title = '',
    void Function()? onPressed,
  }) {
    return OutlineGradientButton(
      onTap: onPressed,
      padding: EdgeInsets.zero,
      strokeWidth: 1.h,
      gradient: LinearGradient(
        begin: const Alignment(0.5, 0),
        end: const Alignment(0.5, 1),
        colors: [
          theme.colorScheme.primary,
          appTheme.deepPurple60000,
        ],
      ),
      corners: const Corners(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.h,
          vertical: 29.v,
        ),
        decoration:
            AppDecoration.gradientOnSecondaryContainerToPurple10016.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: imagePath,
              height: 50.adaptSize,
              width: 50.adaptSize,
              color: appTheme.deepPurple50,
            ),
            SizedBox(height: 20.v),
            Text(
              title,
              style: CustomTextStyles.labelLargeDeeppurple50.copyWith(
                color: appTheme.deepPurple50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.h),
            child: CustomStaggerColumn(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 138.v),
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 32.v),
                        child: card(
                          title: "male".tr,
                          imagePath: "male".icon.svg,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 16.h),
                      Padding(
                        padding: EdgeInsets.only(top: 32.v),
                        child: card(
                          title: "female".tr,
                          imagePath: "female".icon.svg,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.v),
                Text(
                  "select_gender".tr,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 11.v),
                Text(
                  "lorem_ipsum_is_placeholder".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMedium13,
                ),
                SizedBox(height: 86.v),
                OutlineButton(
                  text: "continue".tr,
                  onPressed: onPressed,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
