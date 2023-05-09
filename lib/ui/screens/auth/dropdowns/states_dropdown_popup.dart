// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xilancer/business_logic/controllers/all_controllers.dart';
import 'package:xilancer/business_logic/controllers/country_states_controllers/state_dropdown_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';

class StatesDropdownPopup extends StatelessWidget {
  const StatesDropdownPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: true);

    return Scaffold(
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        enablePullDown: statesDropdownController.currentPage > 1 ? false : true,
        onRefresh: () async {
          final result = await statesDropdownController.fetchCountries(context);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await statesDropdownController.fetchCountries(context);
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
            padding: paddingSym(h: 6, v: 8),
            child: GetBuilder<StatesDropdownController>(builder: (sController) {
              return Column(
                children: [
                  CustomInput(
                    hintText: 'Search state',
                    paddingHorizontal: 17,
                    prefixIcon: Icons.search,
                    onChanged: (v) {},
                  ),
                  gapH(2),
                  sController.statesDropdownList.isNotEmpty
                      ? sController.statesDropdownList[0] !=
                              ConstString.selectState
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: sController.statesDropdownList.length,
                              itemBuilder: (listContext, i) {
                                return InkWell(
                                  onTap: () async {
                                    sController.setStatesValue(
                                        sController.statesDropdownList[i]);

                                    //                         // setting the id of selected value
                                    sController.setSelectedStatesId(
                                        sController.statesDropdownIndexList[
                                            sController.statesDropdownList
                                                .indexOf(sController
                                                    .statesDropdownList[i])]);

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
                                    child:
                                        Text(sController.statesDropdownList[i]),
                                  ),
                                );
                              })
                          : const Text('No state found')
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
