import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/ui/screens/auth/components/auth_helper.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

class SignupFreelancerPage extends StatelessWidget {
  const SignupFreelancerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCommon(title: ConstString.createAnAccount),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
            GetBuilder<TranslateController>(builder: (TranslateController tr) {
          return Container(
            padding: screenPaddingH,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              gapH(10),
              Text(
                tr.getString(ConstString.joinAsAfreelancer),
                style: TextUtils.titleMedium(),
              ),
              gapH(7),

              //first name, last name
              // =================>
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.getString('First name'),
                        style: TextUtils.inputLabel(),
                      ),
                      gapH(4),
                      CustomInput(
                        hintText: 'First name',
                      )
                    ],
                  )),
                  gapW(6),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.getString('Last name'),
                        style: TextUtils.inputLabel(),
                      ),
                      gapH(4),
                      CustomInput(
                        hintText: 'Last name',
                      )
                    ],
                  ))
                ],
              ),

              //email
              // =================>
              Text(
                tr.getString('Email'),
                style: TextUtils.inputLabel(),
              ),
              gapH(4),
              CustomInput(
                hintText: 'Email',
              ),

              //Phone
              // =================>
              Text(
                tr.getString('Phone'),
                style: TextUtils.inputLabel(),
              ),
              gapH(4),
              IntlPhoneField(
                decoration: AuthHelper().phoneFieldDecoration(),
                initialCountryCode: 'IN',
                disableLengthCheck: true,
                onChanged: (phone) {},
              ),

              //email
              // =================>
              Text(
                tr.getString('Email'),
                style: TextUtils.inputLabel(),
              ),
              gapH(4),
              CustomInput(
                hintText: 'Email',
              ),

              //password
              // =================>
              Text(
                tr.getString('Password'),
                style: TextUtils.inputLabel(),
              ),
              gapH(4),
            ]),
          );
        }),
      ),
    );
  }
}
