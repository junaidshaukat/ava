import 'dart:math';

import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/model.dart';
export 'controller/controller.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(SplashController());
  SplashScreen({super.key});

  void onPressed() {}

  Widget roateCard({
    double angle = 0,
    String? imagePath,
    String title = '',
    String description = '',
  }) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(angle),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: OutlineGradientButton(
          strokeWidth: 1.h,
          padding: EdgeInsets.zero,
          gradient: LinearGradient(
            begin: const Alignment(0.5, 0),
            end: const Alignment(0.5, 1),
            colors: [appTheme.deepPurple60000, theme.colorScheme.primary],
          ),
          corners: const Corners(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 26.h,
              vertical: 17.v,
            ),
            decoration: AppDecoration.gradientPurpleToPurple.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: CustomStaggerColumn(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 4.v),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: imagePath,
                    ),
                    SizedBox(width: 8.h),
                    Text(
                      title,
                      style: CustomTextStyles.labelLargeDeeppurple50_1,
                    ),
                  ],
                ),
                SizedBox(height: 7.v),
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
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
                roateCard(
                  title: "jokes".tr,
                  imagePath: "jokes".icon.svg,
                  description: "write_a_joke_that".tr,
                  angle: -0.75 * (pi / 360),
                ),
                roateCard(
                  title: "challenges".tr,
                  imagePath: "challenges".icon.svg,
                  description: "make_challenges".tr,
                  angle: 0.75 * (pi / 360),
                ),
                roateCard(
                  title: "friendly".tr,
                  imagePath: "friendly".icon.svg,
                  description: "this_ai_assistant".tr,
                  angle: -0.75 * (pi / 360),
                ),
                SizedBox(height: 40.v),
                Text("ask_me_anything".tr, style: theme.textTheme.titleLarge),
                SizedBox(height: 11.v),
                Text(
                  "lorem_ipsum_is_placeholder".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMedium13,
                ),
                SizedBox(height: 86.v),
                OutlineGradientButton(
                  padding: EdgeInsets.zero,
                  strokeWidth: 1.h,
                  gradient: LinearGradient(
                    begin: const Alignment(0.5, 0),
                    end: const Alignment(0.5, 1),
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.primary.withOpacity(0)
                    ],
                  ),
                  corners: const Corners(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  child: CustomOutlinedButton(
                    text: "continue".tr,
                    buttonStyle: CustomButtonStyles.outline,
                    onPressed: onPressed,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
