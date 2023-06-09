import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
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
                      return tr.getString(ConstString.plzEnterTitle);
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
                      return tr.getString(ConstString.plzEnterOrganization);
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
                      return tr.getString(ConstString.plzEnterAddress);
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

//==============>
//---------------

pickedTimeContainer({required pickedDate, required VoidCallback ontap}) {
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

Future pickDateTime(BuildContext context) async {
  DateTime? dateTime = await showOmniDateTimePicker(
      context: context, type: OmniDateTimePickerType.date);

  return dateTime;
}
