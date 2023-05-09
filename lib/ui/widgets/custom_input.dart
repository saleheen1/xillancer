import 'package:flutter/material.dart';
import 'package:xilancer/business_logic/core/utils/constant_colors.dart';
import 'package:xilancer/business_logic/core/utils/ui_const.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validation;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  final FocusNode? focusNode;
  final bool isNumberField;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? marginB;
  final double? borderRadius;
  TextEditingController? controller;
  Function()? suffixOnClick = () {};

  CustomInput({
    Key? key,
    this.hintText,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.isPasswordField = false,
    this.focusNode,
    this.isNumberField = false,
    this.controller,
    this.validation,
    this.prefixIcon,
    this.suffixIcon,
    this.paddingHorizontal,
    this.marginB,
    this.borderRadius,
    this.paddingVertical,
    this.suffixOnClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: marginBottom(marginB ?? 5),
        child: TextFormField(
          controller: controller,
          keyboardType:
              isNumberField ? TextInputType.number : TextInputType.text,
          focusNode: focusNode,
          onChanged: onChanged,
          validator: validation,
          textInputAction: textInputAction,
          obscureText: isPasswordField,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(prefixIcon)],
                    )
                  : null,
              suffixIcon: suffixIcon != null
                  ? InkWell(
                      onTap: suffixOnClick,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(suffixIcon)],
                      ),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: inputFieldBorderColor),
                  borderRadius: radius(borderRadius ?? 2)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor),
                  borderRadius: radius(borderRadius ?? 2)),
              errorBorder: OutlineInputBorder(
                  borderRadius: radius(borderRadius ?? 2),
                  borderSide: const BorderSide(color: warningColor)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor),
                  borderRadius: radius(borderRadius ?? 2)),
              hintText: hintText,
              contentPadding: paddingSym(
                  h: paddingHorizontal ?? 4, v: paddingVertical ?? 5)),
        ));
  }
}
