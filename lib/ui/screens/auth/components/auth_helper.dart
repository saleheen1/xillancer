import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';

class AuthHelper {
  phoneFieldDecoration() {
    return InputDecoration(
        labelText: 'Phone Number',
        // hintTextDirection: TextDirection.rtl,
        labelStyle: const TextStyle(color: greyFour, fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: greyFive),
            borderRadius: BorderRadius.circular(9)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: warningColor)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        hintText: 'Enter phone number',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 18));
  }

//============>

  socialLoginButton(String icon, String title, {isloading = false}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: greyFive),
          borderRadius: BorderRadius.circular(6)),
      alignment: Alignment.center,
      height: Get.width * 0.13,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.width * 0.06,
            width: Get.width * 0.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(icon), fit: BoxFit.fitHeight),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          isloading == false
              ? Text(
                  title,
                  style: const TextStyle(color: greyFour),
                )
              : showLoading(),
        ],
      ),
    );
  }
}
