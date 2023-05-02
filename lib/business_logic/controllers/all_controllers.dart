import 'package:get/get.dart';
import 'package:xilancer/business_logic/controllers/signup_controller.dart';
import 'package:xilancer/business_logic/controllers/translate_controller.dart';

initiateControllers() {
  Get.put(TranslateController());
  Get.lazyPut(() => SignupController());
}
