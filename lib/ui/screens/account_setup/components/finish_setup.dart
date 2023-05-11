import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

class FinishSetup extends StatelessWidget {
  const FinishSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingH(5),
      child: GetBuilder<TranslateController>(builder: (tr) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH(7),
            Text(
              tr.getString('What is your hourly rate?'),
              style: TextUtils.title(),
            ),
            gapH(5),
            CustomInput(
              hintText: 'Enter hourly rate',
              isNumberField: true,
            ),
            gapH(2),
            Text(
              tr.getString('Upload profile photo'),
              style: TextUtils.title(),
            ),
            gapH(2),
            Text(
              tr.getString(
                  'Add a professional photo to build trust with clients.'),
              style: TextUtils.paragraphSmall(),
            ),
            gapH(6),

            // profile image
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: Image.asset(
                          'assets/images/avatar.png',
                          height: Get.width * 0.2,
                          width: Get.width * 0.2,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                gapW(5),
                Expanded(
                    flex: 3,
                    child: buttonWithIcon('Upload image', () {},
                        icon: Icons.add_circle_outline, paddingVertical: 14))
              ],
            ),
          ],
        );
      }),
    );
  }
}
