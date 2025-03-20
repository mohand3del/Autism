import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
import 'package:autism/features/profile/presentation/view/widgets/profile_fileds.dart';
import 'package:autism/features/profile/viewModel/cubit/cubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/cubit/profile_cubit.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'profile_header.dart';
import 'profile_header_widget.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key, this.userData});
  final ProfileUserDataResponse? userData;

  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController;
  late final _genderController;
  late final _dateOfBirthController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _genderController = TextEditingController();
    _dateOfBirthController = TextEditingController();

    if (widget.userData != null) {
      _initializeControllers(widget.userData!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: Text("Fetching profile...")),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (userData) => _buildForm(context, userData),
        error: (error) => Center(
          child: Text(error, style: const TextStyle(color: Colors.red)),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, ProfileUserDataResponse userData) {
    _initializeControllers(userData);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ProfileHeader(
              oldImage: userData.user.image, // Pass the old image URL
              showCameraIcon: true,
              onCameraTap: () => context.read<UploadImageCubit>().uploadImage(),
            ),
            verticalSpace(context.height * 36 / 852),
            _buildUserInfo(userData),
            verticalSpace(context.height * 62 / 852),
            ProfileFields(
              formKey: _formKey,
              nameController: _nameController,
              genderController: _genderController,
              dateOfBirthController: _dateOfBirthController,
            ),
            verticalSpace(context.height * 32 / 852),
            CustomBottom(
              text: 'Update Profile',
              onPressed: () => _handleUpdate(context),
            ),
          ],
        ),
      ),
    );
  }

  void _initializeControllers(dynamic userData) {
    _nameController.text = userData.user.name ?? '';
    _genderController.text = userData.user.gender ?? '';
    _dateOfBirthController.text = userData.user.dateOfBirth != null
        ? DateFormat('yyyy-MM-dd').format(userData.user.dateOfBirth!)
        : 'Select Date';
  }

  Widget _buildUserInfo(dynamic userData) {
    return Column(
      children: [
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
      ],
    );
  }

  void _handleUpdate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<EditProfileCubit>().updateProfile(
            fullName: _nameController.text,
            gender: _genderController.text,
            dateOfBirth: _dateOfBirthController.text,
          );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please correct the errors in the form'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
