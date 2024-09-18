

import 'package:autism/features/test/presentation/view/autism_result_view.dart';
import 'package:autism/features/test/presentation/view/non_autism_view.dart';
import 'package:autism/features/test/presentation/view/waiting_view.dart';
import 'package:autism/features/test/viewModel/test_result_cubit/test_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestResultViewBody extends StatelessWidget {
  const TestResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestResultCubit, TestResultState>(
      buildWhen: (previous, current) => current is TestResultLoading || current is TestResultSuccess || current is TestResultError,
        builder: (context, state) {
      return state.when(
        loading: () => WaitingView(),
        success: (autism) {
          return autism ? AutismResultView() : NonAutismView();
        },
        error: (String error) => setupError(),
        initial: () => WaitingView(),

      );




    });
  }
  Widget setupError() {
    return const SizedBox.shrink();
  }
}
