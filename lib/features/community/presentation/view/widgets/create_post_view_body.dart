import 'dart:io';
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/community/presentation/view/widgets/add_image_row.dart';
import 'package:autism/features/community/viewModel/create_post_cubit/create_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostViewBody extends StatelessWidget {
  CreatePostViewBody({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              verticalSpace(context.height * 20 / 852),
              Row(
                children: [
                  SizedBox(
                    height: context.height * 76 / 852,
                    width: context.width * 76 / 393,
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://example.com/doctor_profile.jpg', // Replace with actual image URL
                      ),
                      radius: 25,
                    ),
                  ),
                  horizontalSpace(context.width * 10 / 393),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. John',
                        style: AppStyles.medium24(context).copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Doctor',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(context.height * 12 / 852),

              // Use Visibility to control image display
              BlocBuilder<CreatePostCubit, CreatePostState>(
                builder: (context, state) {
                  final cubit = context.read<CreatePostCubit>();

                  return Column(
                    children: [
                      // Show image only when selected
                      TextField(
                        controller: cubit.textController,
                        keyboardType: TextInputType.multiline,
                        maxLength: 500,
                        maxLines: cubit.selectedImage == null ? 16 : 2,

                        decoration: InputDecoration(
                          hintStyle: AppStyles.regular20(context).copyWith(
                            color: AppColors.grey,
                          ),
                          hintText: 'What‘s on your mind?',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: AppColors.lightGrey),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: AppColors.dotGray),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: AppColors.lightGrey),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: cubit.selectedImage != null,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: context.height * 12 / 852),
                          child: cubit.selectedImage != null
                              ? Image.file(
                            cubit.selectedImage!,
                            width: double.infinity,
                            height: 200, // Adjust as needed
                            fit: BoxFit.cover,
                          )
                              : SizedBox.shrink(),
                        ),
                      ),
                    ],
                  );
                },
              ),

              verticalSpace(context.height * 12 / 852),
              const AddImageRow(),
              verticalSpace(context.height * 12 / 852),
            ],
          ),
        ),
      ),
    );
  }
}
