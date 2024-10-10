
import 'dart:developer';

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/network/app_regex.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';

import 'package:autism/core/widgets/custom_text_field.dart';
import 'package:autism/features/auth/newPassword/viewModel/new_password_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class ConfirmPasswordWidget extends StatefulWidget {
   ConfirmPasswordWidget({super.key, required this.email});
   String email;

  @override
  State<ConfirmPasswordWidget> createState() => _ConfirmPasswordWidgetState();
}

class _ConfirmPasswordWidgetState extends State<ConfirmPasswordWidget> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    passwordController = context.read<NewPasswordCubit>().passwordController;
    setupPasswordControllerListener();
    if (widget.email.isNotEmpty) {
      context.read<NewPasswordCubit>().emailController = widget.email;
    }
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPasswordCubit, NewPasswordState>(
      builder: (context,state) {
        return Form(
          key: context.read<NewPasswordCubit>().formKey,
          child: Column(
              children: [
                AppTextFormField(
                  prefixIcon: Image.asset("assets/images/lock-on.png",height: 30,width: 30,),
                   controller: context.read<NewPasswordCubit>().passwordController,
                  hintText: 'Enter Your Password',
                  isObscureText: isPasswordObscureText,
                  suffixIcon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: context.height*0.018 ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordObscureText = !isPasswordObscureText;
                        });
                      },
                      child:
                      (isPasswordObscureText ?const FaIcon(FontAwesomeIcons.eyeSlash,color: AppColors.lightGrey,) :const FaIcon(FontAwesomeIcons.eye,color: AppColors.lightGrey,)) ,

                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                ),
                verticalSpace(context.height*0.02),
                AppTextFormField(
                  prefixIcon: Image.asset("assets/images/lock-on.png",height: 30,width: 30,),
                   controller: context.read<NewPasswordCubit>().passwordConfirmationController,
                  hintText: 'Enter Your Confirm Password',
                  isObscureText: isPasswordObscureText,
                  suffixIcon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: context.height*0.018 ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
                        });
                      },
                      child:
                      (isPasswordConfirmationObscureText ?const FaIcon(FontAwesomeIcons.eyeSlash,color: AppColors.lightGrey,) :const FaIcon(FontAwesomeIcons.eye,color: AppColors.lightGrey,)) ,

                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                ),
                verticalSpace(context.height*0.1),
                CustomBottom(text: "Reset Password", onPressed: (){
                  validateThenDoNewPassword(context);
                })

              ],
            ),
        );
      }
    );
  }
  void validateThenDoNewPassword(BuildContext context) {
    if (context.read<NewPasswordCubit>().formKey.currentState!.validate()) {


      context.read<NewPasswordCubit>().emitNewPasswordState();
      context.read<NewPasswordCubit>().emailController = widget.email;
      log("email is ======================================================== ${widget.email}");


    }
  }
}
