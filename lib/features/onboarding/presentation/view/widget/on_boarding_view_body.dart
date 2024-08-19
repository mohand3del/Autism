import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/onboarding_list.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/onboarding/view%20model/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'dots_widget.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

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
                  const Spacer(),
                  Center(
                    child: Image.asset(
                      onBoardingList[index].image!,
                      width: width * 0.9,
                      height: height * 0.4,
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
                        children: [
                          verticalSpace(height * 0.035),
                          Text(onBoardingList[index].title!,
                              style: AppStyles.medium20(context)
                                  .copyWith(fontFamily: "Inter")),
                          verticalSpace(height * 0.045),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.05),
                            child: Text(
                              onBoardingList[index].textBody!,
                              style: AppStyles.regular18(context).copyWith(
                                fontFamily: "Inter",
                                color: AppColors.textGrey,
                              ),
                            ),
                          ),
                          verticalSpace(height * 0.038),
                          const DotsWidget(),
                          verticalSpace(height * 0.028),
                          CustomBottom(
                              text: context
                                          .read<OnboardingCubit>()
                                          .currentIndex ==
                                      onBoardingList.length - 1
                                  ? "Get Started"
                                  : "Next",
                              onPressed: () {
                                if (context
                                        .read<OnboardingCubit>()
                                        .currentIndex <
                                    onBoardingList.length - 1) {
                                  context.read<OnboardingCubit>().nextPage();
                                } else {
                                  SharedPrefHelper.setOnBoardingScreenViewed(
                                          key: 'onBoarding', value: true)
                                      .then((value) => {
                                        if (value) {
                                            context.go('/login')
                                  }});

                                  //context.go("/login");
                                }
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
