import 'package:flutter/material.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:image_picker/image_picker.dart';

import 'circular_container_with_image.dart';
import 'tips_container.dart';
import 'package:autism/core/widgets/custom_image_bottom.dart';

class PictureMethodWidget extends StatelessWidget {
  final Function(ImageSource) onImagePicked;

  const PictureMethodWidget({
    super.key,
    required this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
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
              onCameraPressed: () => onImagePicked(ImageSource.camera),
              onGalleryPressed: () => onImagePicked(ImageSource.gallery),
            ),
          ),
        ],
      ),
    );
  }
}
