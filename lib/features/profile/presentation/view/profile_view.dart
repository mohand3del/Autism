import 'package:autism/core/di/di.dart';
import 'package:autism/features/profile/viewModel/profileCubit/profile_cubit.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (_) => getIt<ProfileCubit>()..getProfileData(),
        ),
        BlocProvider(create: (_) => getIt<UploadImageCubit>()),
      ],
      child: Scaffold(
        body: ProfileViewBody(),
      ),
    );
  }
}
