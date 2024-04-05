import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/model.dart';
export 'binding/binding.dart';
export 'controller/controller.dart';

class PremiumScreen extends StatelessWidget {
  final controller = Get.put(PremiumController());
  PremiumScreen({super.key});

  Widget card({
    required String title,
    required String subtitle,
  }) {
    return OutlineGradientButton(
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
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 13.v,
        ),
        decoration: AppDecoration.gradientPurpleToPurple10016.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: CustomTextStyles.labelLarge13.copyWith(
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
            SizedBox(height: 9.v),
            Text(
              subtitle,
              style: CustomTextStyles.bodyMediumPurple10001.copyWith(
                color: appTheme.purple10001,
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
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "premium".image.png,
              ),
            ),
          ),
          child: CustomStaggerColumn(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 16.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "unlock_all_features".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 11.v),
                    Container(
                      margin: EdgeInsets.only(
                        left: 17.h,
                        right: 16.h,
                      ),
                      child: Text(
                        "lorem_ipsum_is_placeholder".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyMedium13,
                      ),
                    ),
                    SizedBox(height: 26.v),
                    card(
                      title: "\$4.99 ${"month".tr}",
                      subtitle: "this_is_the_special".tr,
                    ),
                    SizedBox(height: 12.v),
                    CustomElevatedButton(
                      height: 58.v,
                      text: "upgrade_now".tr,
                      buttonStyle: CustomButtonStyles.none,
                      decoration: CustomButtonStyles
                          .gradientDeepOrangeToIndigoADecoration,
                      buttonTextStyle: CustomTextStyles.bodyMediumPrimary,
                    ),
                    SizedBox(height: 12.v),
                    card(
                      title: "\$4.99".tr,
                      subtitle: "unlimited_lifetime".tr,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
