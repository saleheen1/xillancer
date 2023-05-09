import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/country_states_controllers/country_dropdown_controller.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/auth/dropdowns/country_dropdown_popup.dart';

class CountryDropdown extends StatelessWidget {
  const CountryDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryDropdownController>(builder: (cController) {
      return InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const CountryDropdownPopup();
              });
        },
        child: countryStateDropdownPlaceholder(
            hintText: cController.selectedCountry),
      );
    });
  }
}

countryStateDropdownPlaceholder({required String hintText}) {
  return Container(
    width: double.infinity,
    padding: paddingSym(h: 3, v: 3.5),
    decoration: BoxDecoration(
        border: Border.all(
          color: greyFive,
        ),
        borderRadius: radius(2)),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(hintText), const Icon(Icons.keyboard_arrow_down)]),
  );
}
