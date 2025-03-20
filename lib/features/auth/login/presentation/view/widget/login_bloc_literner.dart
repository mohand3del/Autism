import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';

import 'package:autism/features/auth/login/view%20model/login_cubit.dart';
import 'package:autism/features/auth/login/view%20model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});

  @override
  _LoginBlocListenerState createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<LoginBlocListener> with SingleTickerProviderStateMixin {
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
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
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
          success: (loginResponse) {
            //context.pop();
            context.go('/layout');

          },
          error: (error) {
            setupErrorState(context, error);

          },
        );
      },
      child: const SizedBox.shrink(), // Placeholder or actual child widget here
    );
  }


  void setupErrorState(BuildContext context, String error) {
    context.pop();
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Sorry, $error',
    );
  }

}




