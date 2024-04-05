import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/model.dart';
export 'binding/binding.dart';
export 'controller/controller.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
  ProfileScreen({super.key});

  Widget appBar({
    void Function()? onTapProfile,
    void Function()? onTapPremium,
    void Function()? onTapSetting,
  }) {
    return CustomAppBar(
      centerTitle: true,
      leadingWidth: 48.h,
      leading: Container(
        margin: EdgeInsets.only(left: 16.h),
        decoration: AppDecoration.fillDeepPurple.copyWith(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: AppbarCircleimage(
          imagePath: "back".icon.svg,
          onTap: () {
            Get.back();
          },
        ),
      ),
      title: Text("setting".tr, style: theme.textTheme.bodyLarge),
    );
  }

  Widget card({required String privacyPolicy}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlineGradientButton(
          padding:
              EdgeInsets.only(left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
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
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: CustomIconButton(
            height: 40.adaptSize,
            width: 40.adaptSize,
            padding: EdgeInsets.all(8.h),
            child: CustomImageView(
              imagePath: "list".icon.svg,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.h, top: 12.v, bottom: 8.v),
          child: Text(
            privacyPolicy,
            style: CustomTextStyles.bodyLargeUrbanistPurple100.copyWith(
              color: appTheme.purple100,
            ),
          ),
        ),
        const Spacer(),
        CustomImageView(
          imagePath: "arrow_right".icon.svg,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.symmetric(
            vertical: 8.v,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 16.v),
              appBar(
                onTapProfile: () {
                  Get.to(() => ProfileScreen());
                },
                onTapPremium: () {
                  Get.to(() => PremiumScreen());
                },
                onTapSetting: () {
                  Get.to(() => SettingScreen());
                },
              ),
              SizedBox(height: 16.v),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16.v),
                  decoration:
                      AppDecoration.gradientPurpleToPurple100161.copyWith(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.h),
                      topRight: Radius.circular(16.h),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: CustomStaggerColumn(
                      children: [
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 16.v,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 92.v,
                                width: 80.h,
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CustomImageView(
                                      imagePath: "profile".icon.svg,
                                      height: 80.adaptSize,
                                      width: 80.adaptSize,
                                      radius: BorderRadius.circular(40.h),
                                      alignment: Alignment.topCenter,
                                    ),
                                    CustomIconButton(
                                      height: 32.adaptSize,
                                      width: 32.adaptSize,
                                      decoration: IconButtonStyleHelper
                                          .outlineSecondaryContainer,
                                      alignment: Alignment.bottomRight,
                                      child: CustomImageView(
                                        imagePath: "plus".icon.svg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4.v),
                              Text(
                                "quiche_hollandaise".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                              SizedBox(height: 9.v),
                              Text(
                                "english_teacher".tr,
                                style: CustomTextStyles.bodyMediumPurple10001,
                              ),
                              SizedBox(height: 9.v)
                            ],
                          ),
                        ),
                        SizedBox(height: 34.v),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: card(
                                privacyPolicy: "became_a_pro".tr,
                              ),
                            ),
                            SizedBox(height: 12.v),
                            const Divider(),
                            SizedBox(height: 11.v),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: card(
                                privacyPolicy: "privacy_policy".tr,
                              ),
                            ),
                            SizedBox(height: 12.v),
                            const Divider(),
                            SizedBox(height: 11.v),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: card(
                                privacyPolicy: "about".tr,
                              ),
                            ),
                            SizedBox(height: 12.v),
                            const Divider(),
                            SizedBox(height: 11.v),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: card(
                                privacyPolicy: "ratting".tr,
                              ),
                            ),
                            SizedBox(height: 12.v),
                            const Divider(),
                            SizedBox(height: 11.v),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: card(
                                privacyPolicy: "share".tr,
                              ),
                            ),
                            SizedBox(height: 12.v),
                            const Divider(),
                            SizedBox(height: 11.v),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: card(
                                privacyPolicy: "logout".tr,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
