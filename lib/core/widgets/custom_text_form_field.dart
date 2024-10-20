import 'package:flutter/material.dart';
import '../themes/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.hideText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.textStyle,
    this.radius,
    this.contentPadding,
    this.bgColor,
    this.borderSide,
    this.hintFontWeight,
    this.hintFontSize,
    this.isLastInput = false,
    this.keyboardType,
  });
  final String? hint;
  final bool? hideText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final Color? bgColor;
  final BorderSide? borderSide;
  final FontWeight? hintFontWeight;
  final double? hintFontSize;
  final bool isLastInput;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction:
          isLastInput ? TextInputAction.done : TextInputAction.next,
      controller: controller,
      validator: validator,
      obscureText: hideText ?? false,
      cursorColor: ColorsManager.mainGreen,
      style: textStyle,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        fillColor: bgColor ?? Colors.white,
        filled: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: TextStyle(
          color: ColorsManager.textGrey.withOpacity(.5),
          fontWeight: hintFontWeight ?? FontWeight.w400,
          fontSize: hintFontSize ?? 16,
        ),
        focusedBorder: borderStyle(),
        enabledBorder: borderStyle(),
        border: borderStyle(),
      ),
    );
  }

  OutlineInputBorder borderStyle({Color? color}) {
    return OutlineInputBorder(
      borderSide: borderSide ??
          BorderSide(
            color: color ?? ColorsManager.mainGreen,
            width: 2,
          ),
      borderRadius: BorderRadius.circular(radius ?? 10),
    );
  }
}
