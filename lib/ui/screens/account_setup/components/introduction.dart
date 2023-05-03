import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';
import 'package:xilancer/ui/widgets/textarea_field.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

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
              tr.getString(ConstString.whatProfDescYou) + '?',
              style: TextUtils.title(),
            ),
            gapH(4),
            CustomInput(
              hintText: tr.getString(ConstString.exFrontendDev),
            ),
            gapH(2),
            Text(
              tr.getString(ConstString.provideIntro),
              style: TextUtils.title(),
            ),
            gapH(4),
            TextareaField(
              hintText: tr.getString(ConstString.exIamProDev),
            )
          ],
        ),
      );
    });
  }
}
