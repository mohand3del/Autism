

import 'package:autism/features/onboarding/presentation/view/widget/on_boarding_view_body.dart';
import 'package:autism/features/onboarding/view%20model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const Scaffold(
        body: OnBoardingViewBody(),
      ),
    );
  }
}
