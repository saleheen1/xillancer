import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  var tStrings;

  fetchTranslatedStrings(BuildContext context) async {
    // if (tStrings != null) {
    //   //if already loaded. no need to load again
    //   return;
    // }
    // var connection = await checkConnection(context);
    // if (!connection) return;
    // //internet connection is on
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('token');

    // var data = jsonEncode({
    //   'strings': jsonEncode(translateStrings),
    // });

    // var header = {
    //   //if header type is application/json then the data should be in jsonEncode method
    //   "Accept": "application/json",
    //   "Content-Type": "application/json",
    //   "Authorization": "Bearer $token",
    // };

    // var response = await http.post(Uri.parse(''),
    //     headers: header, body: data);
    // if (response.statusCode == 200) {
    //   tStrings = jsonDecode(response.body)['strings'];
    //   notifyListeners();
    // } else {
    //   //something went wrong
    // }
  }

  getString(String staticString) {
    if (tStrings == null) {
      return staticString;
    }
    if (tStrings.containsKey(staticString)) {
      return tStrings[staticString];
    } else {
      return staticString;
    }
  }
}
