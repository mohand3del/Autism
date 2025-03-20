import 'dart:io';

import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/profile/viewModel/profileCubit/editCubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({
    super.key,
    required this.image,
    this.onCameraTap,
  });
  final String image;
  final VoidCallback? onCameraTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                child: context.read<UploadImageCubit>().uploadImage() == null
                    ? const CircleAvatar(
                        radius: 54,
                        backgroundImage:
                            AssetImage('assets/images/userImage.png'),
                      )
                    : CircleAvatar(
                        radius: 54,
                        // backgroundImage: NetworkImage(image),
                        backgroundImage: FileImage(File(image)),
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
            Positioned(
              bottom: context.height * -32 / 852,
              child: GestureDetector(
                onTap: onCameraTap,
                child: AbsorbPointer(
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
            IgnorePointer(
                ignoring: true, child: Container(color: Colors.white)),
          ],
        );
      },
    );
  }
}
