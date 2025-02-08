import 'package:autism/core/di/di.dart';
import 'package:autism/features/profile/viewModel/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfileData(),
      child:  Scaffold(
        body: ProfileViewBody(),
      ),
    );
  }
}