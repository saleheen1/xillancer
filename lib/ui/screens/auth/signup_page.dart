import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:xilancer/business_logic/controllers/all_controllers.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';
import 'package:xilancer/ui/screens/account_setup/account_setup_page.dart';
import 'package:xilancer/ui/screens/auth/components/auth_helper.dart';
import 'package:xilancer/ui/screens/auth/components/social_login.dart';
import 'package:xilancer/ui/screens/auth/login_page.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

import '../../../business_logic/core/utils/constant_colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCommon(title: ConstString.createAnAccount),
      backgroundColor: Colors.white,
      body: Listener(
        onPointerDown: (_) {
          hideKeyboard(context);
        },
        child: SingleChildScrollView(
          child: GetBuilder<TranslateController>(
              builder: (TranslateController tr) {
            return Container(
              padding: screenPaddingH,
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapH(10),
                      Text(
                        tr.getString(ConstString.joinAsAfreelancer),
                        style: TextUtils.titleBigLight(),
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
                                tr.getString(ConstString.firstName),
                                style: TextUtils.inputLabel(),
                              ),
                              gapH(4),
                              CustomInput(
                                hintText: tr.getString(ConstString.firstName),
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return tr.getString(
                                        ConstString.plzEnterFirstName);
                                  }
                                  return null;
                                },
                              )
                            ],
                          )),
                          gapW(6),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr.getString(ConstString.lastName),
                                style: TextUtils.inputLabel(),
                              ),
                              gapH(4),
                              CustomInput(
                                hintText: tr.getString(ConstString.lastName),
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return tr.getString(
                                        ConstString.plzEnterLastName);
                                  }
                                  return null;
                                },
                              )
                            ],
                          ))
                        ],
                      ),

                      //email
                      // =================>
                      Text(
                        tr.getString(ConstString.email),
                        style: TextUtils.inputLabel(),
                      ),
                      gapH(4),
                      CustomInput(
                        hintText: tr.getString(ConstString.email),
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return tr.getString(ConstString.plzEnterEmail);
                          }
                          return null;
                        },
                      ),

                      //Phone
                      // =================>
                      Text(
                        tr.getString(ConstString.phone),
                        style: TextUtils.inputLabel(),
                      ),
                      gapH(4),
                      IntlPhoneField(
                        decoration: AuthHelper().phoneFieldDecoration(),
                        initialCountryCode: 'IN',
                        disableLengthCheck: true,
                        onChanged: (phone) {},
                      ),

                      gapH(5),

                      //password
                      // =================>
                      Text(
                        tr.getString(ConstString.password),
                        style: TextUtils.inputLabel(),
                      ),
                      gapH(4),
                      Obx(() {
                        return CustomInput(
                          hintText: tr.getString(ConstString.password),
                          suffixIcon: signupController.showPass.value
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          isPasswordField: signupController.showPass.value,
                          suffixOnClick: () {
                            signupController.showPass.value =
                                !signupController.showPass.value;
                          },
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return tr.getString(ConstString.plzEnterPass);
                            }
                            return null;
                          },
                        );
                      }),

                      gapH(3),

                      buttonPrimary(ConstString.createAccount, () {
                        Get.to(const AccountSetupPage());
                      }),

                      gapH(4),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text:
                                  '${tr.getString(ConstString.alreadyHaveAnAccount) + '?'}  ',
                              style: TextStyle(
                                  color: const Color(0xff646464),
                                  fontSize: Get.width * 0.038),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(const LoginPage());
                                      },
                                    text: tr.getString(ConstString.login),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Get.width * 0.038,
                                      color: primaryColor,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),

                      gapH(8),

                      const SocialLogin(),

                      gapH(10),
                    ]),
              ),
            );
          }),
        ),
      ),
    );
  }
}
