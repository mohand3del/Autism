import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';

import 'package:autism/features/auth/signUp/view%20model/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class SignupBlocListener extends StatefulWidget {
  const SignupBlocListener({super.key});

  @override
  State<SignupBlocListener> createState() => _SignupBlocListenerState();
}

class _SignupBlocListenerState extends State<SignupBlocListener> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
      current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpError,
      listener: (context, state) {
        state.whenOrNull(
          signUpLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: SpinKitFadingCube(
                  color: AppColors.primaryColor,
                  size: 50.0,
                  controller: _animationController,
                ),
              ),
            );
            _animationController.repeat();
          },
          signUpSuccess: (signupResponse) {
            context.pop();
            showSuccessDialog(context,signupResponse.message);
          },
          signUpError: (error) {

            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context,String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message,style: AppStyles.medium16(context).copyWith(
                  color: AppColors.black,
                  fontFamily: 'Poppins',
                ),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
               context.go('/login');
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: AppStyles.medium16(context).copyWith(
            color: AppColors.black,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: AppStyles.semiBold16(context).copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}