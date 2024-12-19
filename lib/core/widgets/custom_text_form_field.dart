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
    this.hintFontWeight,
    this.hintFontSize,
    this.isLastInput = false,
    this.keyboardType,
    this.autofocus = false,
    this.onChanged,
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
  final bool autofocus;
  final FontWeight? hintFontWeight;
  final double? hintFontSize;
  final bool isLastInput;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      onChanged: onChanged,
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
        fillColor: bgColor ?? ColorsManager.veryLightGrey,
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
        border: borderStyle(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle({Color? color, BorderSide? borderSide}) {
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
