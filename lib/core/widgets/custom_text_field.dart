

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final void Function(String)? onFieldSubmitted;

  final Widget? prefixIcon;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.prefixIcon, this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     // height: context.height* 0.06,
      width: context.width * 0.87,
      child: TextFormField(

        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
               EdgeInsets.symmetric(horizontal: context.width*0.05, vertical: 14),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintStyle: hintStyle ?? AppStyles.regular16(context).copyWith(
            color: AppColors.lightGrey,
            fontFamily: 'Inter',
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: backgroundColor ?? AppColors.white,
          filled: true,
        ),
        obscureText: isObscureText ?? false,
        style: AppStyles.regular16(context).copyWith(
          color: AppColors.darkGrey,
          fontFamily: 'Inter',
        ),
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }
}