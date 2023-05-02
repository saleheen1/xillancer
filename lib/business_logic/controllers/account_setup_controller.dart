import 'package:get/get.dart';

class AccountSetupController extends GetxController {
  int selectedPage = 0;

  setSelectedPage(int i) {
    selectedPage = i;
    update();
  }

  prevPage(int i) {
    selectedPage = i;
    update();
  }
}
