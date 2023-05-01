import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';

hideKeyboard(BuildContext context, a) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.focusedChild?.unfocus();
  }
}

showLoading({Color? color}) {
  return SpinKitThreeBounce(
    color: color ?? primaryColor,
    size: 16.0,
  );
}
