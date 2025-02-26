import 'dart:io';

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.image,
    this.showCameraIcon = false,
    this.onCameraTap,
  });
  final String image;
  final bool showCameraIcon;
  final VoidCallback? onCameraTap;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2B7FFD), // Match your shape background color
      statusBarIconBrightness: Brightness.light, // Makes status bar icons white
    ));
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
              backgroundImage: _getImageProvider(),
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
            child: InkWell(
              onTap: onCameraTap,
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 4),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ),
      ],
    );
  }

  ImageProvider _getImageProvider() {
    if (image.isEmpty) {
      return const AssetImage('assets/images/default_profile.png');
    }

    try {
      if (image.startsWith('http')) {
        return NetworkImage(image);
      } else {
        return FileImage(File(image));
      }
    } catch (e) {
      return const AssetImage('assets/images/default_profile.png');
    }
  }
}
