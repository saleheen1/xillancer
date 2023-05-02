import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/account_setup_controller.dart';
import 'package:xilancer/business_logic/controllers/auth_controllers/login_controller.dart';
import 'package:xilancer/business_logic/controllers/auth_controllers/signup_controller.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';

initiateControllers() {
  Get.put(TranslateController());
  Get.put(SignupController());
  Get.put(LoginController());
  Get.put(AccountSetupController());
}

SignupController signupController = Get.find<SignupController>();
LoginController loginController = Get.find<LoginController>();
AccountSetupController accountSetupController =
    Get.find<AccountSetupController>();
