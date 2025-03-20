import 'package:autism/features/profile/viewModel/profileCubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_form.dart';
import 'profile_listeners.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
  
    context.read<ProfileCubit>().getProfileData();

    return MultiBlocListener(
      listeners: ProfileListeners.getListeners(),
      child: const ProfileForm(),
    );
  }
}
