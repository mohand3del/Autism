import 'package:autism/features/profile/data/model/edit_contact_info_model.dart';
import 'package:autism/features/profile/viewModel/contactCubit/cubit/contact_info_cubit.dart';
import 'package:autism/features/profile/viewModel/profileCubit/editCubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/profileCubit/profile_cubit.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListenerts {
  static List<BlocListener> getListeners() => [
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
        // BlocListener<ContactInfoCubit, ContactInfoState>(
        //     listener: (context, state) {
        //   state.when(
        //     initial: () {},
        //     loading: () {
        //       _showLoadingDialog(context);
        //     },
        //     loaded: (data) => _handleEditContactInfoSuccess(context),
        //     error: (error) => _handleError(context, error),
        //   );
        // }),
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

  static void _handleEditContactInfoSuccess(BuildContext context) {
    if (!context.mounted) return;
    Navigator.pop(context);
    AnimatedSnackBar.material(
      'Contact info updated successfully',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: const Duration(seconds: 2),
    ).show(context);
    context.read<ContactInfoCubit>().getContactInfo();
  }
}
