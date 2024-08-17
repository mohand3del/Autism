

import 'package:autism/core/network/app_regex.dart';
import 'package:autism/core/widgets/custom_text_field.dart';
import 'package:autism/features/auth/forgetPass/view%20model/forget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  late TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController = context.read<ForgetCubit>().emailController;
    //setupPasswordControllerListener();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(

            prefixIcon: Image.asset('assets/images/email_icon.png',height: 30,width: 30,),

            hintText: 'Enter Your Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<ForgetCubit>().emailController,

          ),
        ],
      ),
    );
  }

  }

