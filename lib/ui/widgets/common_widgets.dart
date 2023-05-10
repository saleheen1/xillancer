import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

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
    title: Text(
      title ?? '',
      style: TextUtils.appbarTitle(),
    ),
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

borderButtonPrimary(
  String title,
  VoidCallback pressed, {
  double paddingVertical = 17,
  double fontsize = 14,
  double borderRadius = 8,
  Color color = greyFour,
  Color borderColor = Colors.grey,
}) {
  return InkWell(
    onTap: pressed,
    child: GetBuilder<TranslateController>(builder: (tr) {
      return Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: paddingVertical),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: Text(
            tr.getString(title),
            style: TextStyle(
              color: color,
              fontSize: fontsize,
            ),
          ));
    }),
  );
}

bRow(
    {String? icon,
    required String title,
    required String text,
    bool hasBorder = false}) {
  return Column(
    children: [
      GetBuilder<TranslateController>(builder: (tr) {
        return Row(
          children: [
            //icon
            SizedBox(
              width: Get.width * 0.4,
              child: Row(children: [
                icon != null
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            icon,
                            height: Get.width * 0.06,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                      )
                    : Container(),
                Text(tr.getString(title), style: TextUtils.paragraphTwo())
              ]),
            ),

            Flexible(
              child: Text(text, style: TextUtils.paragraphTwo()),
            )
          ],
        );
      }),
      hasBorder == true
          ? Container(
              margin: const EdgeInsets.symmetric(vertical: 14),
              child: dividerCommon(),
            )
          : Container()
    ],
  );
}

dividerCommon() {
  return const Divider(
    thickness: 1,
    height: 2,
    color: borderColor,
  );
}
