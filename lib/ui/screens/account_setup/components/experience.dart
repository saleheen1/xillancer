import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslateController>(builder: (tr) {
      return Container(
        padding: screenPaddingH,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH(8),
            Text(
              tr.getString('Tell us about your professional experiences'),
              style: TextUtils.title(),
            ),
            gapH(8),
            addExpBtn(),
            gapH(8),
            educationCard()
          ],
        ),
      );
    });
  }
}

educationCard() {
  return Container(
    padding: paddingSym(h: 4.5, v: 4),
    decoration: BoxDecoration(
        borderRadius: radius(2), border: Border.all(color: borderColor)),
    child: Column(children: [
      //top
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CSE',
                style: TextUtils.title(),
              ),
              gapH(1),
              Text(
                'University of Oxford',
                style: TextUtils.paragraphTwo(),
              )
            ],
          ),
          SvgPicture.asset('assets/svg/edit.svg')
        ],
      ),
      gapH(4),
      dividerCommon(),

      gapH(4),

      bRow(
          icon: 'assets/svg/degree.svg',
          title: 'Degree',
          text: 'B.sc. in computer science & engineering'),

      gapH(5),

      bRow(
          icon: 'assets/svg/calendar.svg',
          title: 'From-To',
          text: '2018- 2022 (Expected)'),

      gapH(3),
    ]),
  );
}

// =============>

addExpBtn() {
  return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: paddingSym(h: 4.5, v: 3),
      decoration: BoxDecoration(
          borderRadius: radius(2), border: Border.all(color: borderColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Add an educational qualification', style: TextUtils.addExp()),
          Icon(
            Icons.add_circle,
            color: primaryColor,
            size: Get.width * 0.08,
          )
        ],
      ));
}
