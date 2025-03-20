import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:autism/core/utils/extentions.dart';

class MethodProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const MethodProgressIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 16 / 393),
      child: StepProgressIndicator(
        totalSteps: totalSteps,
        currentStep: currentStep,
        size: 6,
        padding: 4,
        selectedColor: Colors.blue,
        unselectedColor: Colors.grey[300]!,
        roundedEdges: const Radius.circular(3),
      ),
    );
  }
} 