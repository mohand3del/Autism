import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom_loading_handler.dart';

class SelectedImagePreview extends StatelessWidget {
  final File imageFile;
  final bool isLoading;
  final VoidCallback onSubmitPressed;
  final AnimationController animationController;
  final bool isLastStep;

  const SelectedImagePreview({
    super.key,
    required this.imageFile,
    required this.isLoading,
    required this.onSubmitPressed,
    required this.animationController,
    required this.isLastStep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(context.height * 20 / 852),
        SizedBox(
          height: context.height * 500 / 852,
          width: context.width * 350 / 393,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: Image.file(
              fit: BoxFit.cover,
              imageFile,
              height: 200,
            ),
          ),
        ),
        verticalSpace(context.height * 30 / 852),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomBottomLoadingHandler(
                  onPressed: onSubmitPressed,
                  child: isLoading
                      ? Center(
                          child: SpinKitFadingCube(
                            color: AppColors.white,
                            size: 20.0,
                            controller: animationController,
                          ),
                        )
                      : Text(
                          isLastStep ? "Submit" : "Next Step",
                          style: AppStyles.medium22(context).copyWith(
                            color: AppColors.white,
                            fontFamily: "Poppins",
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
