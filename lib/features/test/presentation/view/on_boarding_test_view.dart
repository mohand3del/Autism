import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/onboarding/view%20model/onboarding_cubit.dart';
import 'package:autism/features/test/presentation/view/widget/onboarding_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingTestView extends StatelessWidget {
  const OnBoardingTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>  OnboardingCubit(),
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: TestOnBoarding()),

    );
  }
}
