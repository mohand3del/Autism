import 'dart:async';
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/onboarding_list.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/onboarding/view%20model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'dots_widget.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  bool isOut = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return PageView.builder(
          controller: context.read<OnboardingCubit>().pageController,
          onPageChanged: (int index) {
            context.read<OnboardingCubit>().changeCurrentIndex(index);
          },
          itemCount: onBoardingList.length,
          itemBuilder: (BuildContext context, int index) => Container(
            color: AppColors.primaryColor,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: SizedBox()),
                Center(
                  child: AnimatedScale(
                    scale: isOut ? 0 : 1,
                    duration: const Duration(milliseconds: 250),
                    child: Image.asset(
                      onBoardingList[index].image!,
                      width: width * 0.9,
                      height: height * 0.4,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: height * 0.43,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpace(height * 0.035),
                        AnimatedOpacity(
                          opacity: isOut ? 0 : 1,
                          duration: const Duration(milliseconds: 500),
                          child: AnimatedPositioned(
                            curve: Curves.easeInOut,
                            left: isOut ? width : width * 0.25,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              onBoardingList[index].title!,
                              textAlign: TextAlign.center,
                              style: AppStyles.medium20(context)
                                  .copyWith(fontFamily: "Inter"),
                            ),
                          ),
                        ),
                        verticalSpace(height * 0.045),
                        AnimatedOpacity(
                          opacity: isOut ? 0 : 1,
                          duration: const Duration(milliseconds: 500),
                          child: AnimatedPositioned(
                            right: isOut ? width : 0,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              onBoardingList[index].textBody!,
                              style: AppStyles.regular18(context).copyWith(
                                fontFamily: "Inter",
                                color: AppColors.textGrey,
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(height * 0.038),
                        DotsWidget(listLength: onBoardingList),
                        verticalSpace(height * 0.028),
                        CustomBottom(
                          text: context.read<OnboardingCubit>().currentIndex ==
                              onBoardingList.length - 1
                              ? "Get Started"
                              : "Next",
                          onPressed: () async {
                            if (context.read<OnboardingCubit>().currentIndex <
                                onBoardingList.length - 1) {
                              triggerScaleAnimation();
                              context.read<OnboardingCubit>().nextPage();
                            } else {
                              await SharedPrefHelper.setOnBoardingScreenViewed(
                                  key: 'onBoarding', value: true)
                                  .then((value) => {
                                if (value) {context.go('/login')}
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void triggerScaleAnimation() {
    setState(() {
      isOut = true;
    });
    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        isOut = false;
      });

    });
  }
}
