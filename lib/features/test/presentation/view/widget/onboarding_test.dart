import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/utils/test_onboarding_list.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/layout/viewModel/layout_cubit.dart';
import 'package:autism/features/onboarding/presentation/view/widget/dots_widget.dart';
import 'package:autism/features/onboarding/view%20model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TestOnBoarding extends StatelessWidget {
  const TestOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return PageView.builder(
            controller: context.read<OnboardingCubit>().pageController,
            onPageChanged: (int index) {
              context.read<OnboardingCubit>().changeCurrentIndex(index);
            },
            itemCount: testOnBoardingList.length,
            itemBuilder: (BuildContext context, int index) => Container(
              color: AppColors.white,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(flex: 1,),
                  Center(
                    child: Image.asset(
                      testOnBoardingList[index].image!,
                      width: context.width * 0.9,
                      height: context.height * 0.4,
                    ),
                  ),
                  //const Spacer(),
                  verticalSpace(context.height * 48 / 852),
                  DotsWidget(listLength: testOnBoardingList,),
                  verticalSpace(context.height * 34 / 852),
                  Text(
                    testOnBoardingList[index].description!,
                    style: AppStyles.regular18(context).copyWith(
                      fontFamily: "Inter",
                      color: AppColors.textGrey,
                    ),
                  ),

                  verticalSpace(context.height * 53 / 852),
                  CustomBottom(
                    text: context.read<OnboardingCubit>().currentIndex == testOnBoardingList.length - 1
                        ? "Get Started"
                        : "Next",
                    onPressed: () async {
                      if (context.read<OnboardingCubit>().currentIndex < testOnBoardingList.length - 1) {
                        context.read<OnboardingCubit>().nextPage();
                      } else {
                        await context.read<LayoutCubit>().completeOnboarding();
                        context.go('/chooseTest');
                      }
                    },
                  ),

                  const Spacer(),
                ],
              ),
            ),
          );
        });
  }
}