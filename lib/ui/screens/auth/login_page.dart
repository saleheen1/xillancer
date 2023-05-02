import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/all_controllers.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';
import 'package:xilancer/ui/screens/auth/components/social_login.dart';
import 'package:xilancer/ui/screens/auth/signup_page.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';
import 'package:xilancer/ui/widgets/custom_input.dart';
import 'package:xilancer/ui/widgets/text_utils.dart';

import '../../../business_logic/core/utils/constant_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCommon(title: ConstString.login),
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
                      gapH(17),

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
                          suffixIcon: loginController.showPass.value
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          isPasswordField: loginController.showPass.value,
                          suffixOnClick: () {
                            loginController.showPass.value =
                                !loginController.showPass.value;
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

                      buttonPrimary(ConstString.login, () {}),

                      gapH(4),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text:
                                  '${tr.getString(ConstString.dontHaveAccount) + '?'}  ',
                              style: TextStyle(
                                  color: const Color(0xff646464),
                                  fontSize: Get.width * 0.038),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(const SignupPage());
                                      },
                                    text: tr.getString(ConstString.signUp),
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
