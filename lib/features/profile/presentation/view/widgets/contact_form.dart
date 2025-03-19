import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/profile/data/model/contact_info_model.dart';
import 'package:autism/features/profile/data/model/edit_contact_info_model.dart';
import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
import 'package:autism/features/profile/presentation/view/widgets/contact_profile_fileds.dart';
import 'package:autism/features/profile/viewModel/contactCubit/cubit/contact_info_cubit.dart';
import 'package:autism/features/profile/viewModel/cubit/cubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/cubit/profile_cubit.dart';
import 'package:autism/features/profile/viewModel/uploadImageCubit/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_form.dart';
import 'profile_header.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key, this.userData, this.contactInfoModel});
  final ProfileUserDataResponse? userData;
  final ContactInfoModel? contactInfoModel;

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;
  late final TextEditingController _facebookController;
  late final TextEditingController _linkedInController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    _facebookController = TextEditingController();
    _linkedInController = TextEditingController();

    // Fetch contact info when widget initializes
    context.read<ContactInfoCubit>().getContactInfo();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    _facebookController.dispose();
    _linkedInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactInfoCubit, ContactInfoState>(
        builder: (context, contactState) {
      return contactState.maybeWhen(
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (contactInfo) {
          _initializeContactControllers(contactInfo);
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, profileState) => profileState.when(
              initial: () => const Center(child: Text("Fetching profile...")),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (userData) {
                _initializeProfileControllers(userData);
                return _buildFormContent(context, userData);
              },
              error: (error) => Center(
                child: Text(error, style: const TextStyle(color: Colors.red)),
              ),
            ),
          );
        },
        error: (error) => Center(
          child: Text(error, style: const TextStyle(color: Colors.red)),
        ),
        orElse: () {
          return const Center(child: CircularProgressIndicator());
        },
      );
    });
  }

  Widget _buildFormContent(
      BuildContext context, ProfileUserDataResponse userData) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ProfileHeader(
              oldImage: userData.user.image,
              showCameraIcon: true,
              onCameraTap: () => context.read<UploadImageCubit>().uploadImage(),
            ),
            verticalSpace(context.height * 22 / 852),
            _buildUserInfo(userData),
            verticalSpace(context.height * 22 / 852),
            ContactProfileFileds(
              formKey: _formKey,
              addressController: _addressController,
              phoneNumberController: _phoneController,
              facebookController: _facebookController,
              linkedInController: _linkedInController,
            ),
            verticalSpace(context.height * 10 / 852),
            CustomBottom(
              text: 'Update Profile',
              onPressed: () => _handleUpdate(context),
            ),
          ],
        ),
      ),
    );
  }

  void _initializeProfileControllers(ProfileUserDataResponse userData) {}

  void _initializeContactControllers(ContactInfoModel contactInfo) {
    if (contactInfo.user.address != null &&
        contactInfo.user.address.isNotEmpty) {
      _addressController.text = contactInfo.user.address;
    }
    if (contactInfo.user.phone != null && contactInfo.user.phone.isNotEmpty) {
      _phoneController.text = contactInfo.user.phone;
    }
    if (contactInfo.user.facebookLink != null &&
        contactInfo.user.facebookLink.isNotEmpty) {
      _facebookController.text = contactInfo.user.facebookLink;
    }
    if (contactInfo.user.linkedinLink != null &&
        contactInfo.user.linkedinLink.isNotEmpty) {
      _linkedInController.text = contactInfo.user.linkedinLink;
    }
  }

  Widget _buildUserInfo(ProfileUserDataResponse userData) {
    return Column(
      children: [
        Text(
          userData.user.name,
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
      // Create contact info model from current values
      final contactInfo = EditContactInfoModel(
        address: _addressController.text,
        phone: _phoneController.text,
        facebookLink: _facebookController.text,
        linkedinLink: _linkedInController.text,
      );

      // Update contact info
      context.read<ContactInfoCubit>().editContactInfo(
            address: _addressController.text,
            phone: _phoneController.text,
            facebook: _facebookController.text,
            linkedIn: _linkedInController.text,
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
