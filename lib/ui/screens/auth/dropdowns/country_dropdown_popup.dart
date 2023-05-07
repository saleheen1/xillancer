// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xilancer/business_logic/controllers/all_controllers.dart';
import 'package:xilancer/business_logic/controllers/country_states_controllers/country_dropdown_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';

class CountryDropdownPopup extends StatelessWidget {
  const CountryDropdownPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: true);

    return Scaffold(
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        enablePullDown:
            countryDropdownController.currentPage > 1 ? false : true,
        onRefresh: () async {
          final result =
              await countryDropdownController.fetchCountries(context);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result =
              await countryDropdownController.fetchCountries(context);
          if (result) {
            debugPrint('loadcomplete ran');
            refreshController.loadComplete();
          } else {
            debugPrint('no more data');
            refreshController.loadNoData();

            Future.delayed(const Duration(seconds: 1), () {
              refreshController.resetNoData();
            });
          }
        },
        child: SingleChildScrollView(
          child: Container(
            padding: paddingH(5),
            child:
                GetBuilder<CountryDropdownController>(builder: (cController) {
              return Column(
                children: [
                  gapH(30),
                  CustomInput(
                    hintText: 'Search country',
                    paddingHorizontal: 17,
                    prefixIcon: 'assets/icons/search.png',
                    onChanged: (v) {},
                  ),
                  gapH(4),
                  cController.countryDropdownList.isNotEmpty
                      ? cController.countryDropdownList[0] !=
                              ConstString.selectCountry
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cController.countryDropdownList.length,
                              itemBuilder: (listContext, i) {
                                return InkWell(
                                  onTap: () async {
                                    cController.setCountryValue(
                                        cController.countryDropdownList[i]);

                                    //                         // setting the id of selected value
                                    cController.setSelectedCountryId(
                                        cController.countryDropdownIndexList[
                                            cController.countryDropdownList
                                                .indexOf(cController
                                                    .countryDropdownList[i])]);

                                    // Provider.of<StateDropdownService>(context,
                                    //         listen: false)
                                    //     .setStateDefault();

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom:
                                                BorderSide(color: greyFive))),
                                    child: Text(
                                        cController.countryDropdownList[i]),
                                  ),
                                );
                              })
                          : const Text('No country found')
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [showLoading()],
                        )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
