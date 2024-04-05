import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/model.dart';
export 'screens/index.dart';
export 'binding/binding.dart';
export 'controller/controller.dart';

class DashboardScreen extends StatelessWidget {
  final controller = Get.put(DashboardController());
  DashboardScreen({super.key});

  Widget appBar({
    void Function()? onTapProfile,
    void Function()? onTapPremium,
    void Function()? onTapSetting,
  }) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: Container(
        margin: EdgeInsets.only(left: 16.h),
        decoration: AppDecoration.fillDeepPurple.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: AppbarCircleimage(
          imagePath: "profile".icon.svg,
          onTap: onTapProfile,
        ),
      ),
      actions: [
        AppbarTrailingButton(
          text: "premium".tr,
          onTap: onTapPremium,
          margin: EdgeInsets.only(left: 16.h),
        ),
        AppbarTrailingImage(
          onTap: onTapSetting,
          imagePath: "setting".icon.svg,
          margin: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 4.v,
          ),
        ),
      ],
    );
  }

  Widget bottomNavigationBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 4.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: OutlineGradientButton(
              padding: EdgeInsets.zero,
              strokeWidth: 1.h,
              gradient: LinearGradient(
                begin: const Alignment(0.5, 0),
                end: const Alignment(0.5, 1),
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withOpacity(0),
                ],
              ),
              corners: const Corners(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: CustomTextFormField(
                hintText: "enter_message".tr,
                hintStyle: CustomTextStyles.bodyLargeBluegray300,
                textInputAction: TextInputAction.done,
                suffix: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      100.h,
                    ),
                    gradient: LinearGradient(
                      begin: const Alignment(0.5, 0),
                      end: const Alignment(0.5, 1),
                      colors: [
                        theme.colorScheme.onSecondaryContainer,
                        appTheme.purple10016,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomImageView(
                      imagePath: "target".icon.svg,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  left: 16.h,
                  top: 15.v,
                  bottom: 15.v,
                ),
                borderDecoration: TextFormFieldStyleHelper.outlineTL25,
                filled: true,
                fillColor: appTheme.indigo900,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: OutlineGradientButton(
              onTap: () => showBottomSheet(context),
              padding: EdgeInsets.zero,
              strokeWidth: 1.h,
              gradient: LinearGradient(
                begin: const Alignment(0.5, 0),
                end: const Alignment(0.5, 1),
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withOpacity(0),
                ],
              ),
              corners: const Corners(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: CustomIconButton(
                height: 50.adaptSize,
                width: 50.adaptSize,
                padding: EdgeInsets.all(8.h),
                decoration: IconButtonStyleHelper.outline,
                child: CustomImageView(
                  imagePath: "mic".icon.svg,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) async {
    controller.speechRecognition();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: appTheme.black900,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          child: SizedBox(
            width: double.maxFinite,
            child: Center(
              child: Lottie.asset('assets/lottie/voice.json'),
            ),
          ),
        );
      },
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
                child: SingleChildScrollView(
                  child: CustomStaggerColumn(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.h,
                            top: 122.v,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 28.adaptSize,
                                width: 28.adaptSize,
                                decoration: AppDecoration.fillOrange.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16,
                                ),
                                child: CustomImageView(
                                  imagePath: "avatar".image.png,
                                  height: 28.adaptSize,
                                  width: 28.adaptSize,
                                  radius: BorderRadius.circular(
                                    14.h,
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 7.h,
                                  top: 6.v,
                                  bottom: 6.v,
                                ),
                                child: Text(
                                  "${"alica".tr} 02:10 ${"pm".tr}",
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHelloNice(),
                          SizedBox(height: 8.v),
                          _buildFrameEleven(),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 250.h,
                            right: 16.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${"inam".tr} 02:10 ${"pm".tr}",
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                              SizedBox(height: 7.v),
                              _buildWelcome(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.v),
              bottomNavigationBar(context),
              SizedBox(height: 16.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHelloNice() {
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
      child: CustomTextFormField(
        width: 154.h,
        hintText: "hello_nice".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameEleven() {
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
        width: 295.h,
        padding: EdgeInsets.symmetric(
          horizontal: 21.h,
          vertical: 8.v,
        ),
        decoration: AppDecoration.gradientPurpleToPurple10016.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 9.v),
            Container(
              width: 241.h,
              margin: EdgeInsets.only(right: 9.h),
              child: Text(
                "welcome_to_livechat_i".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium!.copyWith(
                  height: 2.00,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcome() {
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
      child: CustomOutlinedButton(
        height: 58.v,
        text: "welcome".tr,
        buttonStyle: CustomButtonStyles.none,
        decoration: CustomButtonStyles.gradientPurpleToPurpleTL16Decoration,
        buttonTextStyle: theme.textTheme.bodyMedium!,
      ),
    );
  }
}
