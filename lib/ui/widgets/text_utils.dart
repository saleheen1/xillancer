import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';

class TextUtils {
  static TextStyle titleMedium({color}) {
    return TextStyle(
      color: color ?? greyPrimary,
      fontSize: Get.width * .06,
    );
  }

  static TextStyle titleSmall({color}) {
    return TextStyle(
      color: color ?? greyFour,
      fontSize: Get.width * .045,
    );
  }

  static TextStyle paragraphSmall({color}) {
    return TextStyle(
      color: color ?? greyFour,
      fontSize: Get.width * .035,
    );
  }
}
