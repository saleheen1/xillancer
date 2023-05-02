import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/ui/screens/auth/components/auth_helper.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslateController>(builder: (tr) {
      return Column(
        children: [
          InkWell(
              onTap: () {},
              child: AuthHelper().socialLoginButton('assets/icons/google.png',
                  tr.getString(ConstString.loginWithGoogle),
                  isloading: false)),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: AuthHelper().socialLoginButton('assets/icons/facebook.png',
                tr.getString(ConstString.loginWithFb),
                isloading: false),
          ),
        ],
      );
    });
  }
}
