import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/account_setup_controller.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/account_setup/components/introduction.dart';
import 'package:xilancer/ui/screens/account_setup/components/steps_of_account_setup.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';

class AccountSetupPage extends StatefulWidget {
  const AccountSetupPage({super.key});

  @override
  State<AccountSetupPage> createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarCommon(title: ConstString.setupYourAccount),
      body: GetBuilder<AccountSetupController>(builder: (ac) {
        return GetBuilder<TranslateController>(builder: (tr) {
          return Column(
            children: [
              gapH(10),
              const StepsOfAccountSetup(),
              //

              //Slider =============>
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: 750,
                    child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value) {
                          ac.setSelectedPage(value);
                        },
                        itemCount: 3,
                        itemBuilder: (context, i) {
                          if (i == 0) {
                            return const Introduction();
                          }
                          return null;
                        }),
                  ),
                ),
              ),
            ],
          );
        });
      }),
      bottomNavigationBar: const BottomNavOfAccountSetup(),
    );
  }
}

// ============>

class BottomNavOfAccountSetup extends StatelessWidget {
  const BottomNavOfAccountSetup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslateController>(builder: (tr) {
      return Container(
        height: Get.width / 5,
        padding: paddingH(6),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: borderColor,
              width: 1.0,
            ),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //back
          Container(
              padding: paddingSym(h: 6, v: 3),
              decoration:
                  BoxDecoration(color: borderColor, borderRadius: radius(10)),
              child: Text(tr.getString(ConstString.back))),

          //forward
          Container(
              padding: padding(3.5),
              margin: marginLeft(4),
              decoration: const BoxDecoration(
                  color: primaryColor, shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: Get.width * 0.05,
              )),
        ]),
      );
    });
  }
}
