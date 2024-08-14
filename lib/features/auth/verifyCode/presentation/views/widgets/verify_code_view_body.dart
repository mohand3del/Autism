

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_back_arrow.dart';
import 'package:autism/features/auth/verifyCode/presentation/views/widgets/pin_code_field.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class VerifyCodeViewBody extends StatelessWidget {
  final String? email;
  const VerifyCodeViewBody({super.key, this.email, });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomBackArrow(),
          verticalSpace(context.height * 0.065),

          Padding(padding: EdgeInsets.symmetric(horizontal: context.width * 0.023),
            child: Text("Verification code",style:AppStyles.medium24(context).copyWith(
              color: AppColors.black,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,


            ) ),

          ),
          verticalSpace(context.height * 0.012),
          Padding(padding: EdgeInsets.symmetric(horizontal: context.width * 0.023),
            child: Text("An 4-digit code has been sent to",style:AppStyles.regular18(
                context).copyWith(
              color: AppColors.grey,
              fontFamily: "Lato",

            ) ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(email!,style:AppStyles.regular18(
                  context).copyWith(
                color: AppColors.black,
                fontFamily: "Lato",

              ) ),
              GestureDetector(
                child
                    : Text(" Change",
                  style:AppStyles.regular18(
                      context).copyWith(
                    color: AppColors.primaryColor,
                    fontFamily: "Lato",

                  )

                ),
              ),
              verticalSpace(context.height * 0.078),


            ],
          ),
          verticalSpace(context.height * 0.012),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PinCodeFields(email: email),
          ),

        ],
      ),
    );
  }
}
