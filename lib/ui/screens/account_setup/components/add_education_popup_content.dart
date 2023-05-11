import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/account_setup/components/add_work_exp_popup_content.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

import '../../../../business_logic/controllers/translate_controller.dart';

class AddEducationPopupContent extends StatelessWidget {
  const AddEducationPopupContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingSym(h: 5, v: 5),
      child: SingleChildScrollView(
        child: GetBuilder<TranslateController>(builder: (tr) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //top
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        tr.getString(ConstString.educationalQualification),
                        style: TextUtils.titleLight(),
                      ),
                      gapH(2),
                      Text(
                        tr.getString(ConstString.fillFormToAddEduBg),
                        style: TextUtils.paragraphSmall(color: greyFour),
                      ),
                    ],
                  ),
                ),
                gapH(7),

                //bottom
                Text(
                  tr.getString(ConstString.university),
                  style: TextUtils.inputLabel(),
                ),
                gapH(4),
                CustomInput(
                  hintText: tr.getString(ConstString.enterUniversity),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return tr.getString(ConstString.plzEnterUniversity);
                    }
                    return null;
                  },
                ),

                //
                Text(
                  tr.getString(ConstString.degree),
                  style: TextUtils.inputLabel(),
                ),
                gapH(4),
                CustomInput(
                  hintText: tr.getString(ConstString.enterDegree),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return tr.getString(ConstString.plzEnterDegree);
                    }
                    return null;
                  },
                ),

                //
                Text(
                  tr.getString(ConstString.major),
                  style: TextUtils.inputLabel(),
                ),
                gapH(4),
                CustomInput(
                  hintText: tr.getString(ConstString.enterMajor),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return tr.getString(ConstString.plzEnterMajor);
                    }
                    return null;
                  },
                ),

                //start time end time
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.getString(ConstString.startDate),
                          style: TextUtils.inputLabel(),
                        ),
                        gapH(4),
                        //Picked time

                        pickedTimeContainer(
                          pickedDate: '20/12/22',
                          ontap: () async {
                            var res = await pickDateTime(context);
                            print(res);
                          },
                        )
                      ],
                    )),
                    gapW(5),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.getString(ConstString.endDate),
                          style: TextUtils.inputLabel(),
                        ),
                        gapH(4),
                        //Picked time

                        pickedTimeContainer(
                          pickedDate: '10/03/24',
                          ontap: () async {
                            var res = await pickDateTime(context);
                            print(res);
                          },
                        )
                      ],
                    )),
                  ],
                ),

                gapH(6),
//buttons
                Row(
                  children: [
                    Expanded(
                        child: borderButtonPrimary(ConstString.cancel, () {
                      Get.back();
                    })),
                    gapW(4),
                    Expanded(
                        child: buttonPrimary(ConstString.add, () {
                      Get.back();
                    })),
                  ],
                )
              ]);
        }),
      ),
    );
  }
}
