

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_back_arrow.dart';
import 'package:autism/core/widgets/custom_bottom.dart';

import 'package:autism/features/auth/forgetPass/presentation/views/widgets/email_widget.dart';
import 'package:autism/features/auth/forgetPass/view%20model/forget_cubit.dart';
import 'package:autism/features/auth/login/presentation/view/widget/oauth_widget.dart';
import 'package:autism/features/auth/login/presentation/view/widget/or_divider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';



class ForgetViewBody extends StatelessWidget {
  const ForgetViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        children: [
         const CustomBackArrow(),
          verticalSpace(context.height * 0.065),

          Padding(padding: EdgeInsets.symmetric(horizontal: context.width * 0.023),
            child: Text("Forget Password",style:AppStyles.medium24(context).copyWith(
                color: AppColors.black,
                fontFamily: "Inter",
              fontWeight: FontWeight.w600,

            ) ),

          ),
          verticalSpace(context.height * 0.012),
          Padding(padding: EdgeInsets.symmetric(horizontal: context.width * 0.023),
            child: Text("Enter your email or password ,will \n   send you a confirmation code",style:AppStyles.medium18(context).copyWith(
                color: AppColors.grey,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,

            ) ),

          ),
          verticalSpace(context.height * 0.078),
          const EmailField(),
          verticalSpace(context.height * 0.037),
           CustomBottom(text: "Send Code", onPressed: (){
             validateThenDoForgot(context);

           }),
          verticalSpace(context.height * 0.037),
          OrDivider(),
          verticalSpace(context.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Back To ",style: AppStyles.regular16(context).copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
              ),),
              GestureDetector(
                onTap: (){
                  context.go('/login');
                },
                child: Text("Login",style: AppStyles.regular16(context).copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),),
              ),
            ],
          ),
          verticalSpace(context.height * 0.025),
          const OAuthWidget(),
          verticalSpace(context.height * 0.019),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: AppStyles.semiBold16(context)
                    .copyWith(color: AppColors.black, fontFamily: "Lato"),
              ),
              GestureDetector(
                onTap: (){
                  context.go('/signUp');
                },
                child: Text("Sign Up",style: AppStyles.semiBold16(context).copyWith(
                    color: AppColors.primaryColor,
                    fontFamily: "Lato"
                ),),
              ),

            ],
          ),







        ],

      ),
    );
  }
  void validateThenDoForgot(BuildContext context) {
    if (context.read<ForgetCubit>().formKey.currentState!.validate()) {
      context.read<ForgetCubit>().emitForgetState();
      context.read<ForgetCubit>().formKey.currentState!.save();
      context.go('/verifyCode',extra: context.read<ForgetCubit>().emailController.text);

         }

  }
}
