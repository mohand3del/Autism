

import 'package:autism/core/network/app_regex.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_text_field.dart';
import 'package:autism/features/auth/signUp/view%20model/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/constant/app_colors.dart';

class SignUpUserFormField extends StatefulWidget {
  const SignUpUserFormField({super.key});

  @override
  State<SignUpUserFormField> createState() => _SignUpUserFormFieldState();
}

class _SignUpUserFormFieldState extends State<SignUpUserFormField> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    passwordConfirmationController = context.read<SignUpCubit>().passwordConfirmationController;
    setupPasswordControllerListener();
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
    return Form(
        key: context.read<SignUpCubit>().formKey,
        child:Column(
      children: [
        AppTextFormField(
          prefixIcon: Image.asset("assets/images/user.png",height: 30,width: 30,),
          hintText: 'Enter your full name',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid name';
            }
          },
          controller: context.read<SignUpCubit>().nameController,
        ),
        verticalSpace(context.height*0.02),
        AppTextFormField(
          prefixIcon: GestureDetector(
            onTap: (){},
            child: Image.asset('assets/images/email_icon.png',height: 30,width: 30,),
          ),

          hintText: 'Enter Your Email',
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return 'Please enter a valid email';
            }
          },
          controller: context.read<SignUpCubit>().emailController,
        ),
        verticalSpace(context.height*0.02),
        AppTextFormField(
          prefixIcon: Image.asset("assets/images/lock-on.png",height: 30,width: 30,),
          controller: context.read<SignUpCubit>().passwordController,
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
          controller: context.read<SignUpCubit>().passwordConfirmationController,
          hintText: 'Enter Your Confirm Password',
          isObscureText: isPasswordConfirmationObscureText,
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




      ]
   ));
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
