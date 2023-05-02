import 'package:flutter/material.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/account_setup/components/steps_of_account_setup.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';
import 'package:xilancer/ui/widgets/textarea_field.dart';

class AccountSetupPage extends StatelessWidget {
  const AccountSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarCommon(title: 'Set up your account'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            gapH(10),
            const StepsOfAccountSetup(),

            //

            Container(
              padding: screenPaddingH,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH(8),
                  Text(
                    'Tell us what professional title describes you?',
                    style: TextUtils.title(),
                  ),
                  gapH(4),
                  CustomInput(
                    hintText: 'Ex: Front-End Developer',
                  ),
                  gapH(2),
                  Text(
                    'Provide an intro about yourself',
                    style: TextUtils.title(),
                  ),
                  gapH(4),
                  const TextareaField(
                    hintText: 'e.g. I am a professional develop...',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
