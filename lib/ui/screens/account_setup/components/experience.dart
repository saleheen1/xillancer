import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/account_setup/components/add_work_exp_popup_content.dart';
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
              tr.getString(ConstString.tellUsYourProExp),
              style: TextUtils.title(),
            ),
            gapH(8),
            addExpBtn(
              title: 'Add work experience',
              ontap: () {},
            ),
            educationAndWorkExpCard(
              context,
              title: 'Front-End Developer',
              subtitle: 'Xgenious',
              icon1: 'assets/svg/calendar.svg',
              icon1Title: 'Duration',
              icon1Value: '08 Feb 2022 - Current Position',
              icon2: 'assets/svg/location.svg',
              icon2Title: 'Location',
              icon2Value: '8502 Preston Rd. Inglewood, Maine, USA',
              ontap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const AddWorkExpPopupContent(),
                );
              },
            ),
            addExpBtn(
              title: ConstString.addEduQualification,
              ontap: () {},
            ),
            educationAndWorkExpCard(
              context,
              title: 'CSE',
              subtitle: 'University of Oxford',
              icon1: 'assets/svg/degree.svg',
              icon1Title: ConstString.degree,
              icon1Value: 'B.sc. in computer science & engineering',
              icon2: 'assets/svg/calendar.svg',
              icon2Title: ConstString.fromTo,
              icon2Value: '2018- 2022 (Expected)',
              ontap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const AddWorkExpPopupContent(),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

// ==========>
// -----------

educationAndWorkExpCard(BuildContext context,
    {required String title,
    required String subtitle,
    required String icon1,
    required String icon1Title,
    required String icon1Value,
    required String icon2,
    required String icon2Title,
    required String icon2Value,
    required VoidCallback ontap}) {
  return Container(
    padding: paddingSym(h: 4.5, v: 4),
    margin: marginOnly(left: 0, top: 4, right: 0, bottom: 6),
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
                title,
                style: TextUtils.title(),
              ),
              gapH(1),
              Text(
                subtitle,
                style: TextUtils.paragraphTwo(),
              )
            ],
          ),
          InkWell(onTap: ontap, child: SvgPicture.asset('assets/svg/edit.svg'))
        ],
      ),
      gapH(4),
      dividerCommon(),

      gapH(4),

      bRow(icon: icon1, title: icon1Title, text: icon1Value),

      gapH(5),

      bRow(icon: icon2, title: icon2Title, text: icon2Value),

      gapH(3),
    ]),
  );
}

// =============>
// -------------

addExpBtn({required String title, required VoidCallback ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: paddingSym(h: 4.5, v: 3),
        decoration: BoxDecoration(
            borderRadius: radius(2), border: Border.all(color: borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextUtils.addExp()),
            Icon(
              Icons.add_circle,
              color: primaryColor,
              size: Get.width * 0.08,
            )
          ],
        )),
  );
}

//==============>
//---------------

pickTimeContainer({required pickedDate, required VoidCallback ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      width: double.infinity,
      padding: paddingSym(h: 4, v: 4.2),
      decoration: BoxDecoration(
          border: Border.all(color: greyFive), borderRadius: radius(2)),
      child: Text(
        pickedDate.toString(),
        style: TextUtils.paragraphTwo(color: greyFour),
      ),
    ),
  );
}
