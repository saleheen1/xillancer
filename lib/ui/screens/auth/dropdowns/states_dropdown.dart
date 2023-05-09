import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/country_states_controllers/state_dropdown_controller.dart';
import 'package:xilancer/ui/screens/auth/dropdowns/country_dropdown.dart';
import 'package:xilancer/ui/screens/auth/dropdowns/states_dropdown_popup.dart';

class StatesDropdown extends StatelessWidget {
  const StatesDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatesDropdownController>(builder: (sController) {
      return InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const StatesDropdownPopup();
              });
        },
        child: countryStateDropdownPlaceholder(
            hintText: sController.selectedState),
      );
    });
  }
}
