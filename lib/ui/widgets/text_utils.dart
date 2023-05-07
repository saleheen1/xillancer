import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';

class TextUtils {
  static TextStyle titleBigLight({color}) {
    return TextStyle(
      color: color ?? greyPrimary,
      fontSize: Get.width * .06,
    );
  }

  static TextStyle title({color}) {
    return TextStyle(
        color: color ?? greyPrimary,
        fontSize: Get.width * .045,
        height: 1.3,
        fontWeight: FontWeight.w600);
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

  static TextStyle paragraphTwo({color}) {
    return TextStyle(
      color: color ?? greyFour,
      fontSize: Get.width * .038,
    );
  }

  static TextStyle appbarTitle({color}) {
    return TextStyle(
      color: color ?? greyFour,
      fontSize: Get.width * .045,
    );
  }

  static TextStyle inputLabel({color}) {
    return TextStyle(
      color: color ?? greyFour,
      fontSize: Get.width * .040,
    );
  }

  static TextStyle addExp({color}) {
    return TextStyle(
        color: color ?? primaryColor,
        fontSize: Get.width * .041,
        fontWeight: FontWeight.w600);
  }
}
