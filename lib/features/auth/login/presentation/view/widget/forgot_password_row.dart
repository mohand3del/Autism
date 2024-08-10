

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

import 'custom_check_box.dart';

class ForgotPasswordRow extends StatelessWidget {
  const ForgotPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width * 0.068),
      child:  Row(

        children: [
          CustomCheckBox(
            isChecked: false,
            onChanged: (value) {},
          ),
          horizontalSpace(context.width * 0.018),
          Text("Remember me",style: AppStyles.regular14(context).copyWith(
            color: AppColors.lightGrey,
          ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: (){},
            child: Text("Forgot Password ?",style: AppStyles.medium14(context).copyWith(
              color: AppColors.primaryColor,
            ),
            ),
          ),

        ],



      ),
    );
  }
}
