import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/model.dart';
export 'binding/binding.dart';
export 'controller/controller.dart';

class ContinueAsScreen extends StatelessWidget {
  final controller = Get.put(ContinueAsController());
  ContinueAsScreen({super.key});

  void onPressed() {}

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
                CustomImageView(
                  imagePath: "medal".icon.svg,
                  height: 195.v,
                  width: 177.h,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40.v),
                Text(
                  "best_chat_experience".tr,
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
                  text: "continue_with_google".tr,
                  onPressed: onPressed,
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 10.h),
                    child: CustomImageView(
                      imagePath: "google".icon.svg,
                      height: 22.adaptSize,
                      width: 22.adaptSize,
                    ),
                  ),
                ),
                SizedBox(height: 12.v),
                OutlineButton(
                  text: "continue_as_guest".tr,
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
