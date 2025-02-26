import 'dart:developer';

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/utils/user_data_cache.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/profile/presentation/view/widgets/edit_profile_text_form_feild.dart';
import 'package:autism/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:autism/features/profile/viewModel/cubit/cubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/cubit/profile_cubit.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  String? _imagePath;

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              success: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile updated successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
                context.read<ProfileCubit>().getProfileData();
              },
              error: (error) {
                Navigator.pop(context); // Dismiss loading dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
        ),
        BlocListener<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              success: (image) {
                Navigator.pop(context); // Dismiss loading dialog
                setState(() {
                  _imagePath = image!
                      .path; // Update the image path when upload is successful
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile image updated successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Refresh profile data to get new image
                context.read<ProfileCubit>().getProfileData();
              },
              error: (error) {
                Navigator.pop(context); // Dismiss loading dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
        ),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text("Fetching profile...")),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (userData) {
              _nameController.text = userData.user.name ?? '';
              _genderController.text = userData.user.gender ?? '';
              _dateOfBirthController.text = userData.user.dateOfBirth != null
                  ? DateFormat('yyyy-MM-dd').format(userData.user.dateOfBirth!)
                  : 'Select Date';

              return SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<UploadImageCubit, UploadImageState>(
                        builder: (context, state) {
                      return ProfileHeader(
                        image: context.read<UploadImageCubit>().state.maybeWhen(
                              success: (image) => image?.path ?? '',
                              orElse: () => userData.user.image ?? '',
                            ),
                        showCameraIcon: true,
                        onCameraTap: () {
                          log(userData.user.image);
                          debugPrint("Camera icon tapped");
                          context.read<UploadImageCubit>().uploadImage();
                        },
                      );
                    }),
                    verticalSpace(context.height * 36 / 852),
                    Text(
                      userData.user.name ?? 'No Name',
                      style: AppStyles.medium24(context).copyWith(
                        color: AppColors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      userData.user.email ?? 'No Email',
                      style: AppStyles.regular20(context).copyWith(
                        color: const Color(0xff989898),
                        fontFamily: "Poppins",
                      ),
                    ),
                    verticalSpace(context.height * 62 / 852),
                    EditableTextField(
                      controller: _nameController,
                      label: 'Full Name',
                      initialValue: userData.user.name ?? '',
                    ),
                    EditableTextField(
                      controller: _genderController,
                      label: 'Gender',
                      initialValue: userData.user.gender ?? '',
                    ),
                    _buildDateField(userData.user.dateOfBirth?.toString()),
                    verticalSpace(context.height * 32 / 852),
                    CustomBottom(
                      text: 'Update Profile',
                      onPressed: () {
                        if (_dateOfBirthController.text == 'Select Date') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a date of birth'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        context.read<EditProfileCubit>().updateProfile(
                              fullName: _nameController.text,
                              gender: _genderController.text,
                              dateOfBirth: _dateOfBirthController.text,
                            );

                        //log(_dateOfBirthController.text);
                      },
                    ),
                  ],
                ),
              );
            },
            error: (error) => Center(
              child: Text(error, style: const TextStyle(color: Colors.red)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDateField(String? initialValue) {
    DateTime? initialDate;
    try {
      if (initialValue != null && initialValue != 'null') {
        initialDate = DateTime.parse(initialValue);
      }
    } catch (e) {
      print('Error parsing date: $e');
    }

    return InkWell(
      onTap: () => _selectDate(context),
      child: IgnorePointer(
        child: EditableTextField(
          controller: _dateOfBirthController,
          label: 'Date of Birth',
          initialValue: initialDate != null
              ? DateFormat('yyyy-MM-dd').format(initialDate)
              : 'Select Date',
          suffixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime initialDate = _dateOfBirthController.text != 'Select Date'
          ? DateTime.parse(_dateOfBirthController.text)
          : DateTime.now();

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (picked != null) {
        setState(() {
          _dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(picked);
        });
      }
    } catch (e) {
      // Handle invalid date
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (picked != null) {
        setState(() {
          _dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(picked);
        });
      }
    }
  }
}
