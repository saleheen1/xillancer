import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/widgets/appbar_common.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

class ChooseRolePage extends StatelessWidget {
  const ChooseRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarCommon(context, 'Create an account'),
      body: SingleChildScrollView(
        child: Container(
          padding: paddingH(8),
          child: Column(children: [
            gapH(15),
            Text(
              'Choose a role',
              style: TextUtils.titleMedium(),
            ),
            gapH(2),
            Text(
              'Choose a role from below to continue signing up',
              style: TextUtils.paragraphSmall(),
            ),
            gapH(9),
            chooseRoleCard(
              title: 'Join as a Freelancer',
              icon: 'assets/svg/freelancer.svg',
              ontap: () {},
            ),
            gapH(7),
            chooseRoleCard(
              title: 'Join as a Client',
              icon: 'assets/svg/client.svg',
              ontap: () {},
            ),
          ]),
        ),
      ),
    );
  }
}

chooseRoleCard(
    {required String icon,
    required String title,
    required VoidCallback ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: radius(2),
            border: Border.all(color: greyBorder, width: 1.5)),
        padding: paddingV(6),
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              height: Get.width * 0.17,
            ),
            gapH(3),
            Text(
              title,
              style: TextUtils.titleSmall(),
            ),
          ],
        )),
  );
}
