
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/features/test/presentation/view/widget/tell_us_about_body.dart';
import 'package:autism/features/test/viewModel/tell_about_cubit/tell_about_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TellUsAboutView extends StatelessWidget {
  const TellUsAboutView({super.key, this.totalFormQuestions, this.selectedMethods, });
  final int? totalFormQuestions;
  final List<String>? selectedMethods;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: TellUsAboutBody(
        totalFormQuestions: totalFormQuestions,
        selectedMethods: selectedMethods!,
      ),
    );
  }
}
