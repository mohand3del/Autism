import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/features/profile/viewModel/profileCubit/editCubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/edit_profile_view_body.dart';
import 'widgets/edit_profile_view_body_old.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EditProfileCubit(getIt()),
          ),
          BlocProvider(
            create: (context) => getIt<UploadImageCubit>(),
          ),
        ],
        child: EditProfileViewBody(),
      ),
    );
  }
}
