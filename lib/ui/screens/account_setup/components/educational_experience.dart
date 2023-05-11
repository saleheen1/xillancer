import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/account_setup/components/add_education_popup_content.dart';
import 'package:xilancer/ui/screens/account_setup/components/work_experience.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

class EducationalExperience extends StatelessWidget {
  const EducationalExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingH(5),
      child: GetBuilder<TranslateController>(builder: (tr) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH(8),
            Text(
              tr.getString('What’s your Educational qualification?'),
              style: TextUtils.title(),
            ),
            gapH(8),
            addExpBtn(
              title: ConstString.addEduQualification,
              ontap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => const AddEducationPopupContent(),
                );
              },
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
                  builder: (context) => const AddEducationPopupContent(),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
