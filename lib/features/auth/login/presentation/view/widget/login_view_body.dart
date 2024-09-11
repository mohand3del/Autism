

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';

import 'package:autism/features/auth/login/presentation/view/widget/email_and_password_widget.dart';
import 'package:autism/features/auth/login/presentation/view/widget/login_bloc_literner.dart';
import 'package:autism/features/auth/login/view%20model/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'forgot_password_row.dart';
import 'oauth_widget.dart';
import 'or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
        
           Padding(
             padding:  EdgeInsets.only(top: context.height * 50 / 852 ),
             child: Text("Log in your account",style: AppStyles.medium24(context).copyWith(
               fontFamily: "Inter",
               fontWeight: FontWeight.w600,
        
             ),
        
             textAlign: TextAlign.center,),
           ),
           verticalSpace(context.height * 93 / 852,),
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
              child: const EmailAndPassword(),
        
        
            ),
            verticalSpace(context.height * 0.022),
            const ForgotPasswordRow(),
        
            verticalSpace(context.height * 0.077),
            CustomBottom(text: "Log in", onPressed: (){
              validateThenDoLogin(context);
            },),
            verticalSpace(context.height * 0.063),
            OrDivider(),
            verticalSpace( context.height * 0.024),
            const OAuthWidget(),
            verticalSpace(context.height * 0.0187),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style: AppStyles.semiBold16(context).copyWith(
                  color: AppColors.black,
                  fontFamily: "Lato"
        
                ),),
                GestureDetector(
                  onTap: (){
                   context.go('/signUp');
                  },
                  child: Text("Sign up",style: AppStyles.semiBold16(context).copyWith(
                      color: AppColors.primaryColor,
                      fontFamily: "Lato"
                  ),),
                ),
               const LoginBlocListener()
        
        
              ],
            )
        
        
        
          ],
        ),
      ),
    );
  }
  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
