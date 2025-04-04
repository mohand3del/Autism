
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/test/presentation/view/widget/tell_us_about_body.dart';
import 'package:flutter/material.dart';

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
