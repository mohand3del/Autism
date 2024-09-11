import 'dart:developer';
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/test/presentation/view/widget/questions_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:autism/core/utils/questions_list.dart';

class QuestionSection extends StatelessWidget {
  final int currentFormStep;
  final int totalFormQuestions;
  final VoidCallback onNextStep;
  final VoidCallback onBackStep;
  final VoidCallback onSubmit;

  const QuestionSection({
    required this.currentFormStep,
    required this.totalFormQuestions,
    required this.onNextStep,
    required this.onBackStep,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 16 / 393),
          child: StepProgressIndicator(
            totalSteps: totalFormQuestions,
            currentStep: currentFormStep,
            size: 6,
            padding: 4,
            selectedColor: Colors.blue,
            roundedEdges: const Radius.circular(3),
          ),
        ),
        verticalSpace(context.height * 60 / 852),
        QuestionWidget(
          questionText: getQuestions[currentFormStep - 1].question,
          options: getQuestions[currentFormStep - 1].options,
          onOptionSelected: (selectedOption) {
            log('=============> Selected Option: $selectedOption');
          },
        ),
        _buildNavigationButtons(context),
        verticalSpace(context.height * 20 / 852),
        if  (currentFormStep == totalFormQuestions)
          SizedBox(
            width: context.width * 353 / 393,
            child: CustomBottom(
              text: "Send",
              onPressed: onSubmit,
            ),
          ),
      ],
    );
  }

  // Build navigation buttons (Back, Next, Submit, Continue)
  Widget _buildNavigationButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button (hide if first step)
          if (currentFormStep > 1)
            SizedBox(
              width: context.width * 110 / 393,
              height: context.height * 0.06,
              child:  MaterialButton(
                color: AppColors.white,
                textColor: AppColors.white,
                padding: const EdgeInsets.only(right: 22, left: 22),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: onBackStep,

                child: Text(
                  "Back",
                  style: AppStyles.medium22(context).copyWith(
                    color: AppColors.primaryColor,
                    fontFamily: "Poppins",

                  ),
                ),
            ),
          ),
          const Spacer(),
          if (currentFormStep < totalFormQuestions)
            SizedBox(
              width: context.width * 110 / 393,
              child: CustomBottom(
                text: "Next",
                onPressed: onNextStep,
              ),
            ),
          verticalSpace(context.height * 20 / 852),


        ],
      ),
    );
  }
}
