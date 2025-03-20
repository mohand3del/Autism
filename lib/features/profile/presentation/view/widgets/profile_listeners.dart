import 'package:autism/features/profile/viewModel/profileCubit/editCubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/profileCubit/profile_cubit.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileListeners {
  static List<BlocListener> getListeners() => [
        BlocListener<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              initial: () {},
              loading: () => _showLoadingDialog(context),
              success: () => _handleEditSuccess(context),
              error: (error) => _handleError(context, error),
              orElse: () {},
            );
          },
        ),
        BlocListener<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () => _showLoadingDialog(context),
              success: (image) => _handleImageSuccess(context, image?.path),
              error: (error) => _handleError(context, error),
            );
          },
        ),
      ];

  static void _showLoadingDialog(BuildContext context) {
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  static void _handleEditSuccess(BuildContext context) {
    if (!context.mounted) return;
    Navigator.pop(context);
    AnimatedSnackBar.material(
      'Profile updated successfully',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: const Duration(seconds: 2),
    ).show(context);
    context.read<ProfileCubit>().getProfileData();
  }

  static void _handleImageSuccess(BuildContext context, String? imagePath) {
    if (!context.mounted) return;
    Navigator.pop(context);
    if (imagePath != null) {
      AnimatedSnackBar.material('Profile image updated successfully',
              type: AnimatedSnackBarType.success,
              duration: const Duration(seconds: 2),
              mobileSnackBarPosition: MobileSnackBarPosition.bottom)
          .show(context);
      context.read<ProfileCubit>().getProfileData();
    }
  }

  static void _handleError(BuildContext context, String error) {
    if (!context.mounted) return;
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    AnimatedSnackBar.material(
      error,
      type: AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
