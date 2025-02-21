import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/profile/viewModel/cubit/cubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              backgroundImage: NetworkImage(image),
            ),
          ),
        ),
        if (showCameraIcon)
          Positioned(
            bottom: context.height * -32 / 852,
            child: SizedBox(
              height: 36,
              width: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                    onPressed: onCameraTap,
                  ),
                ),
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
      ],
    );
  }
}
