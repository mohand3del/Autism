import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/onboarding_list.dart';
import 'package:autism/features/onboarding/view%20model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnboardingCubit.get(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                margin: EdgeInsets.only(right: w * 0.022),
                height: h * 0.012,
                width: cubit.currentIndex == index ? w * 0.025 : w * 0.025,
                decoration: BoxDecoration(
                  color: cubit.currentIndex == index ? AppColors.primaryColor : AppColors.dotGray,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}