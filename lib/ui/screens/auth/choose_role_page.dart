import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

class ChooseRolePage extends StatefulWidget {
  const ChooseRolePage({super.key});

  @override
  State<ChooseRolePage> createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarCommon(title: ConstString.createAnAccount),
      body: SingleChildScrollView(
        child:
            GetBuilder<TranslateController>(builder: (TranslateController tr) {
          return Container(
            padding: screenPaddingH,
            child: Column(children: [
              gapH(15),
              Text(
                tr.getString(ConstString.chooseArole),
                style: TextUtils.titleMedium(),
              ),
              gapH(1),
              Text(
                tr.getString(ConstString.chooseRoleToSignup),
                style: TextUtils.paragraphSmall(),
              ),
              gapH(9),
              chooseRoleCard(
                title: tr.getString(ConstString.joinAsAfreelancer),
                icon: 'assets/svg/freelancer.svg',
                selected: selectedIndex == 0 ? true : false,
                ontap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              gapH(7),
              chooseRoleCard(
                title: tr.getString(ConstString.joinAsAclient),
                icon: 'assets/svg/client.svg',
                selected: selectedIndex == 1 ? true : false,
                ontap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
            ]),
          );
        }),
      ),
      bottomNavigationBar: SizedBox(
        height: Get.height * 0.2,
        child: buttonPrimary('Continue', () {}),
      ),
    );
  }
}

chooseRoleCard(
    {required String icon,
    required String title,
    required VoidCallback ontap,
    required bool selected}) {
  return InkWell(
    onTap: ontap,
    child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: selected ? primaryColor.withOpacity(.04) : Colors.white,
            borderRadius: radius(2),
            border: Border.all(
                color: selected ? primaryColor : greyBorder, width: 1.5)),
        padding: paddingV(6),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: Get.width * 0.14,
              colorFilter: ColorFilter.mode(
                  selected ? primaryColor : greyFour, BlendMode.srcIn),
            ),
            gapH(3),
            Text(
              title,
              style: TextUtils.titleSmall(
                  color: selected ? primaryColor : greyFour),
            ),
          ],
        )),
  );
}
