import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/widgets/custom_image_bottom.dart';
import 'package:flutter/material.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'circular_container_with_image.dart';
import 'tips_container.dart';

class ImageMethodSection extends StatelessWidget {
  final int currentImageStep;
  final List<String> selectedMethods;
  final VoidCallback onNextStep;

  const ImageMethodSection({
    super.key,
    required this.currentImageStep,
    required this.selectedMethods,
    required this.onNextStep,
  });

  @override
  Widget build(BuildContext context) {
    // final imageMethodIndex = selectedMethods.indexOf('Form') == -1
    //     ? currentImageStep - 1
    //     : currentImageStep;
    final imageMethods = selectedMethods.where((method) => method != 'Form').toList();
    final imageMethodIndex = currentImageStep - 1;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 16 / 393),
          child: StepProgressIndicator(
            totalSteps:
              imageMethods.length ,
            currentStep: imageMethodIndex + 1 ,
            size: 6,
            padding: 4,
            selectedColor: Colors.blue,
            unselectedColor: Colors.grey[300]!,
            roundedEdges: const Radius.circular(3),
          ),
        ),
        verticalSpace(context.height * 20 / 852),
        Expanded(
          child: imageMethodIndex < imageMethods.length ? _buildImageMethodWidget(
              imageMethods[imageMethodIndex], context) : Container(),
        )
        //_buildNextButton(context),
      ],
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 16 / 393),
      child: SizedBox(
        width: context.width * 110 / 393,
        child: CustomBottom(
          text: currentImageStep < selectedMethods.length ? "Next" : "Submit",
          onPressed: onNextStep,
        ),
      ),
    );
  }

  Widget _buildImageMethodWidget(String method, BuildContext context) {
    switch (method) {
      case 'Picture':
        return _buildPicturesWidget(context);
      case 'Drawing':
       return _buildDrawingWidget(context);
      case 'Coloring':
       return _buildColoringWidget(context);
      case 'Hand Right':
       return _buildHandRightWidget(context);
      default:
        return Container();
    }
  }

  Widget _buildPicturesWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           Center(
            child: Text(
              "Upload face image",
              style: AppStyles.medium26(context).copyWith(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
      
              ),
            ),
          ),
          const CircularContainerWithImage(
            imageProvider: AssetImage('assets/images/ph_scan.png'),
          ),
          verticalSpace(context.height * 12 / 852),
          Text(
            "Tips before take a photo",
            style: AppStyles.regular18(context).copyWith(fontFamily: 'Poppins'),
          ),
          verticalSpace(context.height * 12 / 852),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
            child: const TipsContainer(
              tips: [
                '• Capture clear facial expressions.',
                '• Photograph the child in a natural environment like home or garden.',
                '• Choose a comfortable time for the child.',
                '• Use natural lighting.',
                '• Focus on the eyes to reflect emotions.',
              ],
            ),
          ),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
            child: CustomImageBottom(
                cameraImagePath: "assets/images/camera.png",
                galleryImagePath: "assets/images/gallery.png",
                onCameraPressed: () {},
                onGalleryPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawingWidget(BuildContext context) {
    return Column(
      children: [
         Center(
          child: Text(
            "Upload Drawing image",
            style: AppStyles.medium26(context).copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,

            ),
          ),
        ),
        const CircularContainerWithImage(
          imageProvider: AssetImage('assets/images/drawing.png'),
        ),
        verticalSpace(context.height * 12 / 852),
        Text(
          "Tips before take a photo",
          style: AppStyles.regular18(context).copyWith(fontFamily: 'Poppins'),
        ),
        verticalSpace(context.height * 12 / 852),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: const TipsContainer(
            tips: [
              'Ensure a quiet, distraction-free environment.',
              'Use pencils for drawing.',
              'Let the child draw freely without strict guidelines',
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: CustomImageBottom(
              cameraImagePath: "assets/images/camera.png",
              galleryImagePath: "assets/images/gallery.png",
              onCameraPressed: () {},
              onGalleryPressed: () {}),
        ),
      ],
    );
  }

  Widget _buildColoringWidget(BuildContext context) {
    return Column(
      children: [
         Center(
          child: Text(
            "Upload Coloring image",
            style: AppStyles.medium26(context).copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,

            ),
          ),
        ),
        const CircularContainerWithImage(
          imageProvider: AssetImage('assets/images/coloring.png'),
        ),
        verticalSpace(context.height * 12 / 852),
        Text(
          "Tips before take a photo",
          style: AppStyles.regular18(context).copyWith(fontFamily: 'Poppins'),
        ),
        verticalSpace(context.height * 12 / 852),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: const TipsContainer(
            tips: [
              'Use simple geometric shapes.',
              'Offer a variety of colors.',
              'Ensure a comfortable, well-lit space for the child.'
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: CustomImageBottom(
              cameraImagePath: "assets/images/camera.png",
              galleryImagePath: "assets/images/gallery.png",
              onCameraPressed: () {},
              onGalleryPressed: () {}),
        ),
      ],
    );
  }
  Widget _buildHandRightWidget(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Upload hand-write image",
            style: AppStyles.medium26(context).copyWith(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,

            ),
          ),
        ),
        const CircularContainerWithImage(
          imageProvider: AssetImage('assets/images/hand_right.png'),
        ),
        verticalSpace(context.height * 12 / 852),
        Text(
          "Tips before take a photo",
          style: AppStyles.regular18(context).copyWith(fontFamily: 'Poppins'),
        ),
        verticalSpace(context.height * 12 / 852),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: const TipsContainer(
            tips: [
              'Use simple geometric shapes.',
              'Offer a variety of colors.',
              'Ensure a comfortable, well-lit space for the child.'
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: CustomImageBottom(
              cameraImagePath: "assets/images/camera.png",
              galleryImagePath: "assets/images/gallery.png",
              onCameraPressed: () {},
              onGalleryPressed: () {}),
        ),
      ],
    );
  }
}
