import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/auth/dropdowns/country_dropdown.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
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
              title: ConstString.addEduQualification,
              ontap: () {},
            ),
            gapH(8),
            educationCard(context)
          ],
        ),
      );
    });
  }
}

educationCard(BuildContext context) {
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
          InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => addEduPopup(),
                );
              },
              child: SvgPicture.asset('assets/svg/edit.svg'))
        ],
      ),
      gapH(4),
      dividerCommon(),

      gapH(4),

      bRow(
          icon: 'assets/svg/degree.svg',
          title: ConstString.degree,
          text: 'B.sc. in computer science & engineering'),

      gapH(5),

      bRow(
          icon: 'assets/svg/calendar.svg',
          title: ConstString.fromTo,
          text: '2018- 2022 (Expected)'),

      gapH(3),
    ]),
  );
}

// =============>

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

// ======================>

addEduPopup() {
  return Container(
    padding: paddingSym(h: 4, v: 5),
    child: SingleChildScrollView(
      child: GetBuilder<TranslateController>(builder: (tr) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //top
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Work experience',
                  style: TextUtils.titleLight(),
                ),
                gapH(2),
                Text(
                  'Fill the form below to add your work exprience',
                  style: TextUtils.paragraphSmall(color: greyFour),
                ),
              ],
            ),
          ),
          gapH(7),

          //bottom
          Text(
            tr.getString('Title'),
            style: TextUtils.inputLabel(),
          ),
          gapH(4),
          CustomInput(
            hintText: tr.getString('Ex: Front-End Developer'),
            validation: (value) {
              if (value == null || value.isEmpty) {
                return tr.getString('');
              }
              return null;
            },
          ),

          //
          Text(
            tr.getString('Organization'),
            style: TextUtils.inputLabel(),
          ),
          gapH(4),
          CustomInput(
            hintText: tr.getString('Enter organization'),
            validation: (value) {
              if (value == null || value.isEmpty) {
                return tr.getString('');
              }
              return null;
            },
          ),

          //
          Text(
            tr.getString('Address'),
            style: TextUtils.inputLabel(),
          ),
          gapH(4),
          CustomInput(
            hintText: tr.getString('Enter address'),
            validation: (value) {
              if (value == null || value.isEmpty) {
                return tr.getString('');
              }
              return null;
            },
          ),

          //country state
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.getString('Select country'),
                    style: TextUtils.inputLabel(),
                  ),
                  gapH(4),
                  const CountryDropdown(),
                ],
              )),
              gapW(5),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.getString('Select country'),
                    style: TextUtils.inputLabel(),
                  ),
                  gapH(4),
                  const CountryDropdown(),
                ],
              )),
            ],
          )
        ]);
      }),
    ),
  );
}
