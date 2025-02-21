import 'package:autism/core/di/di.dart';
import 'package:autism/features/profile/viewModel/cubit/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => EditProfileCubit(getIt()),
        child: EditProfileViewBody(),
      ),
    );
  }
}
