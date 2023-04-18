import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xilancer/ui/screens/auth/choose_role_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xilancer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChooseRolePage(),
    );
  }
}
