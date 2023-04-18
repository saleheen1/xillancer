import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

appbarCommon(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Theme.of(context).cardColor,
    toolbarHeight: Get.width * .17,
    leadingWidth: Get.width * .07,
    elevation: .7,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(CupertinoIcons.chevron_left, color: Colors.white),
    ).paddingOnly(left: Get.width * .04),
    title: Text(title),
  );
}
