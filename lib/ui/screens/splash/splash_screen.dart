import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/all_controllers.dart';
import 'package:xilancer/ui/screens/auth/choose_role_page.dart';

import '../../../business_logic/core/utils/ui_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    initiateControllers();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(const ChooseRolePage());
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: Get.height,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.fitHeight)),
              ),
              const SizedBox(
                height: 15,
              ),
              showLoading()
            ],
          ),
        ));
  }
}
