

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/features/resource/presentation/view/widget/resource_view_body.dart';
import 'package:autism/features/resource/viewModel/resource_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourceView extends StatelessWidget {
  const ResourceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
          create: (context) => getIt<ResourceCubit>()..fetchResources(),
          child: const ResourceViewBody()),
    );
  }
}
