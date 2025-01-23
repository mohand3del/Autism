


import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CustomBottomLoadingHandler extends StatelessWidget {
  const CustomBottomLoadingHandler({super.key, this.validator, required this.onPressed, required this.child});

  final Function(String?)? validator;
  final VoidCallback onPressed;
  final Widget child;
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
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: onPressed,

        child: child,
      ),
    );
  }
}
