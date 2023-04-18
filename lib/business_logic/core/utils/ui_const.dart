import 'package:flutter/material.dart';
import 'package:get/get.dart';

SizedBox gapH(double number) => SizedBox(height: Get.width * number / 100);
SizedBox gapW(double number) => SizedBox(width: Get.width * number / 100);
EdgeInsets padding(double number) => EdgeInsets.all(Get.width * number / 100);
EdgeInsets paddingRight(double number) =>
    EdgeInsets.only(right: Get.width * number / 100);
EdgeInsets paddingLeft(double number) =>
    EdgeInsets.only(left: Get.width * number / 100);
EdgeInsets paddingTop(double number) =>
    EdgeInsets.only(top: Get.width * number / 100);
EdgeInsets paddingBottom(double number) =>
    EdgeInsets.only(bottom: Get.width * number / 100);
EdgeInsets paddingH(double number) =>
    EdgeInsets.symmetric(horizontal: Get.width * number / 100);
EdgeInsets paddingV(double number) =>
    EdgeInsets.symmetric(vertical: Get.width * number / 100);

EdgeInsets paddingSym({required double h, required double v}) {
  return EdgeInsets.symmetric(
      horizontal: Get.width * h / 100, vertical: Get.width * v / 100);
}

BorderRadius radius(double number) =>
    BorderRadius.circular(Get.width * number / 100);

BorderRadius radiusTop(double number) {
  return BorderRadius.only(
      topLeft: Radius.circular(Get.width * number / 100),
      topRight: Radius.circular(Get.width * number / 100));
}

BorderRadius radiusLeft(double number) {
  return BorderRadius.only(
      topLeft: Radius.circular(Get.width * number / 100),
      bottomLeft: Radius.circular(Get.width * number / 100));
}

BorderRadius radiusRight(double number) {
  return BorderRadius.only(
      bottomRight: Radius.circular(Get.width * number / 100),
      topRight: Radius.circular(Get.width * number / 100));
}

BorderRadius radiusBottom(double number) {
  return BorderRadius.only(
      bottomLeft: Radius.circular(Get.width * number / 100),
      bottomRight: Radius.circular(Get.width * number / 100));
}

EdgeInsets paddingZero = EdgeInsets.zero;

var shrink = const SizedBox.shrink();

final shimmerGradient = LinearGradient(colors: [
  Get.theme.cardColor.withAlpha(50),
  Get.theme.secondaryHeaderColor.withAlpha(40),
  Get.theme.cardColor.withAlpha(40),
  Get.theme.secondaryHeaderColor.withAlpha(60),
]);
