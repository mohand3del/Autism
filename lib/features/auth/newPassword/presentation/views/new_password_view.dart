import 'package:autism/core/di/di.dart';
import 'package:autism/features/auth/forgetPass/view%20model/forget_cubit.dart';
import 'package:autism/features/auth/newPassword/presentation/views/widgets/new_pass_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordView extends StatelessWidget {
  String email;
   NewPasswordView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
          create: (BuildContext context) => getIt<ForgetCubit>(),
          child: NewPasswordViewBody(email: email,)),
    );
  }
}
