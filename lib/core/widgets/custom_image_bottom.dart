import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CustomImageBottom extends StatelessWidget {
  final String cameraImagePath;
  final String galleryImagePath;
  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;

  const CustomImageBottom({
    required this.cameraImagePath,
    required this.galleryImagePath,
    required this.onCameraPressed,
    required this.onGalleryPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height:context.height * 50 / 852,
          width:context.width * 137 / 393,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),

          ),
          child: MaterialButton(
            onPressed: onCameraPressed,
            child: Row(
              children: [
                Image.asset(
                  cameraImagePath,
                  width: 22,
                  height: 20,
                ),
                horizontalSpace( context.width * 8 / 393,),
                 Text('Camera',style: AppStyles.regular16(context).copyWith(
                   color: AppColors.primaryColor,
                   fontFamily: "Poppins",

                 ),),
              ],
            ),
          ),
        ),
        Container(
          height:context.height * 50 / 852,
          width:context.width * 137 / 393,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),

          ),
          child: MaterialButton(
            onPressed: onGalleryPressed,
            child: Row(
              children: [
                Image.asset(
                  galleryImagePath,
                  width: 22,
                  height: 20,
                ),
                 horizontalSpace( context.width * 8 / 393,),
                Text('Gallery',style: AppStyles.regular16(context).copyWith(
                  color: AppColors.primaryColor,
                  fontFamily: "Poppins",

                ),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}