

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/features/test/viewModel/test_result_cubit/test_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/test_result_view_body.dart';

class TestResultView extends StatelessWidget {
  const TestResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body:  BlocProvider(
          create: (context) => TestResultCubit(getIt())..getTestResult(),
          child: const TestResultViewBody()),
    );
  }
}
