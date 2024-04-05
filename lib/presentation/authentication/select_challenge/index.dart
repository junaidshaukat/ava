import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/model.dart';
export 'binding/binding.dart';
export 'controller/controller.dart';

class SelectChallengeScreen extends StatelessWidget {
  final controller = Get.put(SelectChallengeController());
  SelectChallengeScreen({super.key});

  void onPressed() {}

  Widget card({
    String? imagePath,
    String title = '',
    String subtitle = '',
    bool isPremium = false,
    void Function()? onPressed,
  }) {
    return SizedBox(
      width: 150.h,
      height: 174.v,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 12.v,
            child: OutlineGradientButton(
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
                width: 150.h,
                height: 150.v,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 16.v,
                ),
                decoration: AppDecoration
                    .gradientOnSecondaryContainerToPurple10016
                    .copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: imagePath,
                      height: 62.adaptSize,
                      width: 62.adaptSize,
                    ),
                    SizedBox(height: 16.v),
                    Text(
                      title,
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 3.v),
                    Text(
                      subtitle,
                      style: CustomTextStyles.bodySmall10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isPremium)
            CustomElevatedButton(
              width: 80.h,
              height: 24.v,
              text: "premium".tr,
              buttonStyle: CustomButtonStyles.none,
              decoration:
                  CustomButtonStyles.gradientDeepOrangeToIndigoADecoration2,
              alignment: Alignment.topCenter,
            ),
        ],
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
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: CustomStaggerColumn(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 138.v),
                Wrap(
                  spacing: 8.h,
                  children: [
                    card(
                      isPremium: true,
                      title: "trivia_quiz".tr,
                      subtitle: "start_now".tr,
                      imagePath: "trivia_quiz".icon.svg,
                      onPressed: () {},
                    ),
                    card(
                      isPremium: true,
                      title: "truth_or_lie".tr,
                      subtitle: "start_now".tr,
                      imagePath: "truth_or_lie".icon.svg,
                      onPressed: () {},
                    ),
                    card(
                      title: "choose_the_best".tr,
                      subtitle: "start_now".tr,
                      imagePath: "choose_the_best".icon.svg,
                      onPressed: () {},
                    ),
                    card(
                      title: "guess_the_celebrity".tr,
                      subtitle: "start_now".tr,
                      imagePath: "guess_the_celebrity".icon.svg,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 40.v),
                Text(
                  "select_challenge".tr,
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
