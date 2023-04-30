import 'package:flutter/material.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';

class AuthHelper {
  phoneFieldDecoration() {
    return InputDecoration(
        labelText: 'Phone Number',
        // hintTextDirection: TextDirection.rtl,
        labelStyle: const TextStyle(color: greyFour, fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: greyFive),
            borderRadius: BorderRadius.circular(9)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: warningColor)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor)),
        hintText: 'Enter phone number',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 18));
  }
}
