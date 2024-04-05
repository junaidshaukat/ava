import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/model.dart';
export 'binding/binding.dart';
export 'controller/controller.dart';

class RegisterNameScreen extends StatelessWidget {
  final controller = Get.put(RegisterNameController());
  RegisterNameScreen({super.key});

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
                  imagePath: "register_name".icon.svg,
                  height: 195.v,
                  width: 177.h,
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40.v),
                OutlineInput(
                  hintText: "enter_name".tr,
                ),
                SizedBox(height: 40.v),
                Text(
                  "enter_name".tr,
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
