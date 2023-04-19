import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';

appbarCommon(
    {String? title, bool hasBackButton = true, bool centerTitle = false}) {
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: Get.width * .17,
    leadingWidth: Get.width * .21,
    centerTitle: centerTitle,
    elevation: .7,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Row(
        children: [
          Container(
              padding: paddingSym(h: 5, v: 2),
              margin: marginLeft(4),
              decoration:
                  BoxDecoration(color: borderColor, borderRadius: radius(10)),
              child: const Icon(Icons.arrow_back, color: greyFour)),
        ],
      ),
    ),
    title: Text(title ?? ''),
  );
}

//common primary button =======>
buttonPrimary(String title, VoidCallback pressed,
    {isloading = false,
    bgColor,
    double paddingVertical = 18,
    double borderRadius = 8,
    double fontsize = 14,
    fontColor = Colors.white}) {
  return InkWell(
    onTap: pressed,
    child: GetBuilder<TranslateController>(
      builder: (TranslateController tr) => Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: paddingVertical),
          decoration: BoxDecoration(
              color: bgColor ?? primaryColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: isloading == false
              ? Text(
                  tr.getString(title),
                  style: TextStyle(
                    color: fontColor,
                    fontSize: fontsize,
                  ),
                )
              : showLoading(color: Colors.white)),
    ),
  );
}
