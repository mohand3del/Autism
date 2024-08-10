


import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.text, this.validator, required this.onPressed});
  final String text;
  final Function(String?)? validator;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.88,
      height: context.height * 0.06,
      child: MaterialButton(
        color: AppColors.primaryColor,
        textColor: AppColors.white,
        padding: const EdgeInsets.only(right: 22, left: 22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: onPressed,

        child: Text(
          text,
          style: AppStyles.medium22(context).copyWith(
            color: AppColors.white,
            fontFamily: "Poppins",

          ),
        ),
      ),
    );
  }
}
