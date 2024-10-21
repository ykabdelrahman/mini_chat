import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomProfileField extends StatelessWidget {
  const CustomProfileField({
    super.key,
    this.keyboardType,
    this.suffixIcon,
    required this.text,
    this.hint,
    this.hideText = false,
    this.controller,
    this.validator,
    this.isLastInput = false,
  });
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String text;
  final String? hint;

  final bool? hideText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isLastInput;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: ColorsManager.textGrey,
          ),
        ),
        const SizedBox(height: 6),
        CustomTextFormField(
          isLastInput: isLastInput,
          keyboardType: keyboardType,
          suffixIcon: suffixIcon,
          hint: hint,
          hideText: hideText,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}
