import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/auth/login/presentation/view/widget/oauth_widget.dart';
import 'package:autism/features/auth/login/presentation/view/widget/or_divider.dart';
import 'package:autism/features/auth/signUp/view%20model/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'sign_up_bloc_listener.dart';
import 'sign_up_user_form_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: context.height * 0.12,
                left: context.width * 0.2,
                right: context.width * 0.2),
            child: Text(
              "Create new account",
              style: AppStyles.medium24(context).copyWith(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          verticalSpace(
            context.height * 0.085,
          ),
          const SignUpUserFormField(),
          verticalSpace(context.height * 0.07),
          CustomBottom(text: "Sign Up", onPressed: () {
            validateThenDoSignup(context);
          }),
          verticalSpace(context.height * 0.055),
          OrDivider(),
          verticalSpace(context.height * 0.024),
          const OAuthWidget(),
          verticalSpace(context.height * 0.0187),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: AppStyles.semiBold16(context)
                    .copyWith(color: AppColors.black, fontFamily: "Lato"),
              ),
              GestureDetector(
                onTap: (){
                  context.go('/login');
                },
                child: Text("Login",style: AppStyles.semiBold16(context).copyWith(
                    color: AppColors.primaryColor,
                    fontFamily: "Lato"
                ),),
              ),
              const SignupBlocListener(),
            ],
          ),
        ],
      ),
    );
  }
  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignupStates();
    }
  }
}
