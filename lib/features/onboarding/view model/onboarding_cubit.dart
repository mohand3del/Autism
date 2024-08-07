import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial()){
    pageController = PageController();
  }
  int currentIndex = 0;
  late PageController pageController;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeDotsState());
  }

  void nextPage() {
    currentIndex++;
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
    );
    emit(NextPageState());
  }

}
