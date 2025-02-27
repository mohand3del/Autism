import 'dart:io';

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    this.oldImage,
    this.showCameraIcon = false,
    this.onCameraTap,
  });

  final String? oldImage; // User's current profile image from API
  final bool showCameraIcon;
  final VoidCallback? onCameraTap;

  @override
  Widget build(BuildContext context) {
    final uploadedImage = context.watch<UploadImageCubit>().selectedImage;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.maxFinite,
          height: context.height * 220 / 852,
          child: SvgPicture.asset(
            'assets/images/profile_shape.svg',
            width: double.infinity,
            height: context.height * 220 / 852,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: context.height * -20 / 852,
          child: SizedBox(
            height: context.height * 100 / 852,
            width: context.width * 100 / 393,
            child: CircleAvatar(
              radius: 54,
              // backgroundImage: NetworkImage(image),
              backgroundImage: _getImageProvider(uploadedImage),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 40,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
              //  context.read<ProfileCubit>().getProfileData();
            },
          ),
        ),
        if (showCameraIcon)
          Positioned(
            bottom: context.height * -22 / 852,
            child: BlocBuilder<UploadImageCubit, UploadImageState>(
              builder: (context, state) {
                return InkWell(
                  onTap: onCameraTap,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 4),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  ImageProvider<Object> _getImageProvider(File? uploadedImage) {
    if (uploadedImage != null) {
      return FileImage(uploadedImage);
    } else if (oldImage != null && oldImage!.isNotEmpty) {
      return NetworkImage(oldImage!);
    } else {
      return const AssetImage('assets/images/default_avatar.png');
    }
  }
}
