import 'package:flutter/material.dart';
import 'package:xilancer/business_logic/core/utils/const_strings.dart';
import 'package:xilancer/business_logic/core/utils/ui_utils.dart';
import 'package:xilancer/ui/widgets/common_widgets.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCommon(title: ConstString.createAnAccount),
      body: SingleChildScrollView(
        child: Container(
          padding: screenPaddingH,
          child: Column(children: const []),
        ),
      ),
    );
  }
}
