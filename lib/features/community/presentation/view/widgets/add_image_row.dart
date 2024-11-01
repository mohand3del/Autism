

import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/community/viewModel/create_post_cubit/create_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddImageRow extends StatelessWidget {
  const AddImageRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePostCubit>();
    return    SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: (){
                cubit.pickImage(fromCamera: true);
              },
              child: Image.asset('assets/images/cameraPost.png')),
          horizontalSpace(context.width * 8 / 393),
          GestureDetector(
              onTap: (){
                cubit.pickImage(fromCamera: false);
              },
              child: Image.asset('assets/images/galaryPost.png')),
        ],
      ),
    );
  }
}
