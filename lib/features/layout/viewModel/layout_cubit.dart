import 'dart:developer';

import 'package:autism/core/helper/shared_preferences_helper.dart';
import 'package:autism/features/home/presentation/views/home_view.dart';
import 'package:autism/features/resource/presentation/view/resource_view.dart';
import 'package:autism/features/test/presentation/view/choose_test_view.dart';
import 'package:autism/features/test/presentation/view/on_boarding_test_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'layout_state.dart';



// class LayoutCubit extends Cubit<LayoutStates> {
//   LayoutCubit() : super(LayoutInitialStates()) {
//     _initialize();
//   }
//
//   static LayoutCubit get(BuildContext context) => BlocProvider.of(context);
//
//   bool? isOnboardingViewed;
//   final List<Widget> screens = [
//     const HomeView(),
//     const HomeView(), // Placeholder, will be replaced later
//     Column(),         // Placeholder for future implementation
//     Column(),         // Placeholder for future implementation
//   ];
//
//   int currentIndex = 0;
//
//   /// Change the currently selected index and update the UI
//   void changeCurrentIndex(int index) {
//     currentIndex = index;
//     emit(LayoutChangeCurrentIndexStates());
//   }
//
//   /// Initialize the state, retrieving the onboarding status
//   Future<void> _initialize() async {
//     isOnboardingViewed = await SharedPrefHelper.getOnBoardingTestScreenViewed() ?? false;
//     _updateSecondScreen();
//     emit(LayoutInitialStates());
//   }
//
//   /// Update the second screen based on whether onboarding was viewed
//   void _updateSecondScreen() {
//     if (isOnboardingViewed == true) {
//       screens[1] = ChooseTestView();
//       log("ChooseTestView has been assigned to screens[1]");
//     } else {
//       screens[1] = const OnBoardingTestView();
//       log("OnBoardingTestView has been assigned to screens[1]");
//     }
//   }
//
//   /// Determine if the navigation bar should be hidden based on current state
//   bool shouldHideNavBar(int currentIndex) {
//     log('Current Index: $currentIndex');
//     log('Is Onboarding Viewed: $isOnboardingViewed');
//     return currentIndex == 1 && isOnboardingViewed == false;
//   }
// }
class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialStates()) {
    loadOnboardingState();
  }

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  bool? isOnboardingViewed;
  final List<Widget> screens = [
    const HomeView(),
    const ChooseTestView(),
    const Column(),    // Placeholder, will be replaced later
    const ResourceView(),         // Placeholder for future implementation
       // Placeholder for future implementation
  ];

  int currentIndex = 0;

  /// Change the currently selected index and update the UI
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(LayoutChangeCurrentIndexStates());
  }

  /// Initialize the state, retrieving the onboarding status
  Future<void> loadOnboardingState() async {
    isOnboardingViewed = await SharedPrefHelper.getOnBoardingTestScreenViewed();
    emit(LayoutChangeCurrentIndexStates());
  }

  /// Update the second screen based on whether onboarding was viewed
  void _updateSecondScreen() {
    if (isOnboardingViewed == true) {
      screens[1] = const ChooseTestView();
      log("ChooseTestView has been assigned to screens[1]");
    } else {
      screens[1] = const OnBoardingTestView();
      log("OnBoardingTestView has been assigned to screens[1]");
    }
  }

  /// Call this method after onboarding is finished to update the view and nav bar visibility
  Future<void> completeOnboarding() async {
    // تأكيد تحديث الحالة في SharedPreferences
    await SharedPrefHelper.setOnBoardingTestScreenViewed(key: 'onBoardingTest', value: true);

    // تحديث المتغير المحلي
    isOnboardingViewed = true;


    _updateSecondScreen();


    emit(LayoutChangeCurrentIndexStates());
  }

  /// Determine if the navigation bar should be hidden based on current state
  bool shouldHideNavBar(int currentIndex) {

    if (currentIndex == 1 && isOnboardingViewed == false) {
      return true;
    }
    return false;
  }
}




// class LayoutCubit extends Cubit<LayoutStates>
// {
//   LayoutCubit():super(LayoutInitialStates());
//   static LayoutCubit get(context)=>BlocProvider.of(context);
//
//   List<Widget>screens=[
//     const HomeView(),
//     const ChooseTestView(),
//     Column(),
//     Column(),
//   ];
//
//   int currentIndex=0;
//
//   void changeCurrentIndex(index)
//   {
//     currentIndex=index;
//     emit(LayoutChangeCurrentIndexStates());
//   }
// }