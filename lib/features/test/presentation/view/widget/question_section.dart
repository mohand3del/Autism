import 'dart:developer';
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/widgets/custom_bottom_loading_handler.dart';
import 'package:autism/features/test/viewModel/form_cubit/form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/test/presentation/view/widget/questions_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:autism/core/utils/questions_list.dart';

class QuestionSection extends StatefulWidget {
  final int currentFormStep;
  final int totalFormQuestions;
  final VoidCallback onNextStep;
  final VoidCallback onBackStep;
  final VoidCallback onSubmit;
  final bool hasMoreMethods;
  final List<String> selectedMethods;

  const QuestionSection({
    super.key,
    required this.currentFormStep,
    required this.totalFormQuestions,
    required this.onNextStep,
    required this.onBackStep,
    required this.onSubmit,
    required this.hasMoreMethods,
    required this.selectedMethods,
  });

  @override
  _QuestionSectionState createState() => _QuestionSectionState();
}

class _QuestionSectionState extends State<QuestionSection>
    with SingleTickerProviderStateMixin {
  final Map<int, String> _answers = {};
  bool _isLoading = false;
  late AnimationController _animationController;

  void _onOptionSelected(int questionIndex, String selectedOption) {
    setState(() {
      _answers[questionIndex] = selectedOption;
    });
    log('Selected Option for Q${questionIndex + 1}: $selectedOption');
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 16 / 393),
          child: StepProgressIndicator(
            totalSteps: widget.totalFormQuestions,
            currentStep: widget.currentFormStep,
            size: 6,
            padding: 4,
            selectedColor: Colors.blue,
            roundedEdges: const Radius.circular(3),
          ),
        ),
        verticalSpace(context.height * 60 / 852),
        QuestionWidget(
          questionText: getQuestions[widget.currentFormStep - 1].question,
          options: getQuestions[widget.currentFormStep - 1].options,
          onOptionSelected: (selectedOption) {
            _onOptionSelected(widget.currentFormStep - 1, selectedOption);
          },
        ),
        _buildNavigationButtons(context),
        verticalSpace(context.height * 20 / 852),
        if (widget.currentFormStep == widget.totalFormQuestions)
          SizedBox(
            width: context.width * 353 / 393,
            child: CustomBottomLoadingHandler(
              child: _isLoading
                  ? Center(
                      child: SpinKitFadingCube(
                        color: AppColors.white,
                        size: 20.0,
                        controller: _animationController,
                      ),
                    )
                  : Text(
                      "Send",
                      style: AppStyles.medium22(context).copyWith(
                        color: AppColors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
              onPressed: () {
                setState(() => _isLoading = true);
                final answers = List.generate(
                  widget.totalFormQuestions,
                  (index) => _answers[index] ?? '',
                );

                context
                    .read<FormCubit>()
                    .submitForm(
                      q1: answers[0],
                      q2: answers[1],
                      q3: answers[2],
                      q4: answers[3],
                      q5: answers[4],
                      q6: answers[5],
                      q7: answers[6],
                      q8: answers[7],
                      q9: answers[8],
                      q10: answers[9],
                    )
                    .then(
                  (_) {
                    if (widget.selectedMethods.length > 1) {
                      widget.onNextStep();
                    } else {
                      context.go('/testResult');
                    }
                    setState(() => _isLoading = false);
                  },
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.currentFormStep > 1)
            SizedBox(
              width: context.width * 110 / 393,
              height: context.height * 0.06,
              child: MaterialButton(
                color: AppColors.white,
                textColor: AppColors.white,
                padding: const EdgeInsets.only(right: 22, left: 22),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: widget.onBackStep,
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
          if (widget.currentFormStep < widget.totalFormQuestions)
            SizedBox(
              width: context.width * 110 / 393,
              child: CustomBottom(
                text: "Next",
                onPressed: widget.onNextStep,
              ),
            ),
          verticalSpace(context.height * 20 / 852),
        ],
      ),
    );
  }
}
