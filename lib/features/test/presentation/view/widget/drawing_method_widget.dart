import 'package:flutter/material.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:image_picker/image_picker.dart';

import 'circular_container_with_image.dart';
import 'tips_container.dart';
import 'package:autism/core/widgets/custom_image_bottom.dart';

class DrawingMethodWidget extends StatelessWidget {
  final Function(ImageSource) onImagePicked;

  const DrawingMethodWidget({
    super.key,
    required this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
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
            onCameraPressed: () => onImagePicked(ImageSource.camera),
            onGalleryPressed: () => onImagePicked(ImageSource.gallery),
          ),
        ),
      ],
    );
  }
}
