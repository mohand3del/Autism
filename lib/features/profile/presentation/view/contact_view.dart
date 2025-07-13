import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'widgets/contact_view_body.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UploadImageCubit>(),
        ),
      ],
      child: const Scaffold(
          backgroundColor: AppColors.white, body: ContactViewBody()),
    );
  }
}
