import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/account_setup/components/account_setup_helper.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

import '../../../../business_logic/controllers/account_setup_controller.dart';

class StepsOfAccountSetup extends StatelessWidget {
  const StepsOfAccountSetup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountSetupController>(builder: (acController) {
      return Container(
        padding: paddingSym(v: 8, h: 5),
        decoration: BoxDecoration(
            color: const Color(0xffF9FAFB),
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(.1),
                width: 2.0,
              ),
              bottom: BorderSide(
                color: Colors.grey.withOpacity(.1),
                width: 2.0,
              ),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Page steps show =======>
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0; i < AccountSetupHelper().topics.length; i++)
                  Row(
                    children: [
                      Container(
                        height: Get.width * 0.09,
                        width: Get.width * 0.09,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: acController.selectedPage >= i
                                ? primaryColor
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: acController.selectedPage >= i
                                    ? Colors.transparent
                                    : greyFive)),
                        child: acController.selectedPage - 1 < i
                            ? Text(
                                '${i + 1}',
                                style: TextStyle(
                                    color: acController.selectedPage >= i
                                        ? Colors.white
                                        : greyPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            : const Icon(
                                Icons.check_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                      ),
                      //line
                      i > AccountSetupHelper().topics.length - 2
                          ? Container()
                          : Container(
                              height: 2,
                              width: Get.width / 4 - 65,
                              color: acController.selectedPage >= i
                                  ? primaryColor
                                  : greyFive,
                            )
                    ],
                  ),
              ],
            ),
            gapH(4),

            // ==========>
            Text(
              'How would you professionally introduce yourself?',
              style: TextUtils.paragraphTwo(),
            ),

            gapH(6),

            // next
            Container(
              padding: paddingSym(h: 3, v: 2.5),
              color: const Color(0xffEAECF0),
              child: RichText(
                text: TextSpan(
                  text: 'Next:  ',
                  style: TextStyle(
                      color: const Color(0xff667085),
                      fontSize: Get.width * 0.036),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Experience',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Get.width * 0.036,
                          color: Colors.grey[600],
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
