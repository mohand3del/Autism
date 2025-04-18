import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial()){
    pageController = PageController();
  }
  int currentIndex = 0;
  late PageController pageController;
  static OnboardingCubit get(context) => BlocProvider.of(context);

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeDotsState());
  }

  void nextPage() {
    currentIndex++;
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    emit(NextPageState());
  }

}
