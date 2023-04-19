import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';

Future<bool> checkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    // Get.snackbar(ConstString.noInternet, ConstString.plzCheckInternet);
    Get.rawSnackbar(message: ConstString.plzCheckInternet);
    return false;
  } else {
    return true;
  }
}

removeUnderscore(value) {
  return value.replaceAll(RegExp('_'), ' ');
}

getDateOnly(date) {
  if (date == null) return ' ';
  return DateFormat('dd/MM/yyyy').format(date);
}

hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.focusedChild?.unfocus();
  }
}

runAtHomeScreen(BuildContext context) {
  firstAppOpenSet();
}

runAtStart(BuildContext context) {}

// startStripe() async {
//   //start stripe
//   //============>
//   var publishableKey = await StripeService().getStripeKey();
//   Stripe.publishableKey = publishableKey;
//   Stripe.instance.applySettings();
// }

firstAppOpenSet() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('firstRun', false);
}
