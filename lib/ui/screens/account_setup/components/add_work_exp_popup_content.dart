import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/account_setup/components/experience.dart';
import 'package:xilancer/ui/screens/auth/dropdowns/country_dropdown.dart';
import 'package:xilancer/ui/screens/auth/dropdowns/states_dropdown.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

import '../../../../business_logic/controllers/translate_controller.dart';

class AddWorkExpPopupContent extends StatelessWidget {
  const AddWorkExpPopupContent({
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
                        tr.getString(ConstString.workExp),
                        style: TextUtils.titleLight(),
                      ),
                      gapH(2),
                      Text(
                        tr.getString(ConstString.fillFormToAddWorkExp),
                        style: TextUtils.paragraphSmall(color: greyFour),
                      ),
                    ],
                  ),
                ),
                gapH(7),

                //bottom
                Text(
                  tr.getString(ConstString.title),
                  style: TextUtils.inputLabel(),
                ),
                gapH(4),
                CustomInput(
                  hintText: tr.getString(ConstString.exFrontendDev),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return tr.getString('');
                    }
                    return null;
                  },
                ),

                //
                Text(
                  tr.getString(ConstString.organization),
                  style: TextUtils.inputLabel(),
                ),
                gapH(4),
                CustomInput(
                  hintText: tr.getString(ConstString.enterOrganization),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return tr.getString('');
                    }
                    return null;
                  },
                ),

                //
                Text(
                  tr.getString(ConstString.address),
                  style: TextUtils.inputLabel(),
                ),
                gapH(4),
                CustomInput(
                  hintText: tr.getString(ConstString.enterAddress),
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return tr.getString('');
                    }
                    return null;
                  },
                ),
                gapH(1),

                //country state
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.getString(ConstString.selectCountry),
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
                          tr.getString(ConstString.selectState),
                          style: TextUtils.inputLabel(),
                        ),
                        gapH(4),
                        const StatesDropdown(),
                      ],
                    )),
                  ],
                ),

                gapH(5),

                //start time end time
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.getString('Start date'),
                          style: TextUtils.inputLabel(),
                        ),
                        gapH(4),
                        //Picked time

                        pickTimeContainer(
                          pickedDate: '20/12/22',
                          ontap: () {},
                        )
                      ],
                    )),
                    gapW(5),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.getString('End date'),
                          style: TextUtils.inputLabel(),
                        ),
                        gapH(4),
                        //Picked time

                        pickTimeContainer(
                          pickedDate: '10/03/24',
                          ontap: () {},
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
                        child: borderButtonPrimary('Cancel', () {
                      Get.back();
                    })),
                    gapW(4),
                    Expanded(
                        child: buttonPrimary('Add', () {
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
