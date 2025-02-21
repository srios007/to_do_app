import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.isLoading,
    required this.onPressed,
    this.color,
    this.colorText,
    this.fontSize,
    this.height,
    this.width,
  });

  final Color? color;
  final Color? colorText;
  final double? fontSize;
  final double? height;
  final double? width;
  final RxBool isLoading;
  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: width ?? Get.width - 40,
        height: height ?? 55,
        child: MaterialButton(
          color: color ?? Palette.mainColor,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          onPressed: isLoading.value ? () {} : onPressed,
          child: isLoading.value
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Palette.white,
                    ),
                  ),
                )
              : Text(
                  buttonText,
                  style: TextStyle(
                      color: colorText ?? Palette.white,
                      fontSize: fontSize ?? 18,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
