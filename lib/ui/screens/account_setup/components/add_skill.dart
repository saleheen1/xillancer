import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

class AddSkill extends StatelessWidget {
  const AddSkill({super.key});

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
              tr.getString(
                  'What kinds of services will  you provide to clients?'),
              style: TextUtils.title(),
            ),
            gapH(8),
            GridView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (_, int index) {
                  return Container(
                    padding: padding(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: greyFive),
                        borderRadius: radius(3)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/pen_tool.svg',
                          height: 28,
                        ),
                        gapH(4),
                        Text(
                          'Website Development',
                          textAlign: TextAlign.center,
                          style: TextUtils.paragraphTwo(),
                        ),
                      ],
                    ),
                  );
                })
          ],
        );
      }),
    );
  }
}
