import 'package:animated_snack_bar/animated_snack_bar.dart';
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
import 'package:autism/features/profile/viewModel/profileCubit/editCubit/edit_profile_cubit.dart';
import 'package:autism/features/profile/viewModel/profileCubit/profile_cubit.dart';
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
  bool _isLoading = false;
  bool _isSubmitting = false;
  ProfileUserDataResponse? _userData;

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
    return BlocListener<ContactInfoCubit, ContactInfoState>(
      listener: (context, contactState) {
        contactState.maybeWhen(
          loading: () {
            // Only show loading if it's not right after a submission
            if (!_isSubmitting) {
              setState(() => _isLoading = true);
            }
          },
          loaded: (contactInfo) {
            setState(() {
              _isLoading = false;
              _isSubmitting = false;
            });
            _initializeContactControllers(contactInfo);

            // If we were submitting, show success message
            if (_isSubmitting) {
              AnimatedSnackBar.material(
                'Profile updated successfully!',
                type: AnimatedSnackBarType.success,
                duration: const Duration(seconds: 3),
              ).show(context);
            }
          },
          error: (error) {
            setState(() => _isLoading = false);

            // If we're submitting a form and get an error, check if it's
            // a real error with the submission or just a refresh error
            if (_isSubmitting) {
              // Check if the error message is about "no internet connection"
              if (error.toLowerCase().contains("no internet") ||
                  error.toLowerCase().contains("not connection internet") ||
                  error.contains("SocketException") ||
                  error.contains("timed out")) {
                // Show success for the update but mention that refresh failed
                AnimatedSnackBar.material(
                  'Profile updated successfully! (Data refresh failed)',
                  type: AnimatedSnackBarType.success,
                  duration: const Duration(seconds: 3),
                ).show(context);

                setState(() => _isSubmitting = false);
                return;
              }

              // Show actual error
              _showErrorSnackbar(error);
              setState(() => _isSubmitting = false);
            } else {
              // If not submitting, show normal error
              _showErrorSnackbar(error);
            }
          },
          orElse: () {},
        );
      },
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, profileState) {
          profileState.maybeWhen(
              loaded: (userData) {
                setState(() {
                  _userData = userData;
                });
              },
              orElse: () {});
        },
        builder: (context, profileState) {
          return profileState.when(
            initial: () => const Center(child: Text("Fetching profile...")),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (userData) {
              return _buildFormContent(context, userData);
            },
            error: (error) => Center(
              child: Text(error, style: const TextStyle(color: Colors.red)),
            ),
          );
        },
      ),
    );
  }

  void _showErrorSnackbar(String error) {
    String message = error;
    if (error.toLowerCase().contains("no internet") ||
        error.toLowerCase().contains("not connection internet") ||
        error.contains("SocketException") ||
        error.contains("timed out")) {
      message =
          "No internet connection. Please check your connection and try again.";
    }

    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.error,
      duration: const Duration(seconds: 3),
    ).show(context);

    // Add a floating action button for retry action
    Future.delayed(const Duration(milliseconds: 300), () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Tap to retry"),
          backgroundColor: Colors.blueGrey,
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Retry',
            textColor: Colors.white,
            onPressed: () {
              context.read<ContactInfoCubit>().getContactInfo();
            },
          ),
        ),
      );
    });
  }

  Widget _buildFormContent(
      BuildContext context, ProfileUserDataResponse userData) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ProfileHeader(
                  oldImage: userData.user.image,
                  showCameraIcon: true,
                  onCameraTap: () =>
                      context.read<UploadImageCubit>().uploadImage(),
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
                  onPressed: _isLoading || _isSubmitting
                      ? () {}
                      : () => _handleUpdate(context),
                ),
                const SizedBox(height: 20), // Add extra space at the bottom
              ],
            ),
          ),
        ),
        if (_isLoading || _isSubmitting)
          Container(
            color: Colors.black26,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
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
      // Update UI to show loading and mark as submitting
      setState(() {
        _isLoading = true;
        _isSubmitting = true;
      });

      // Show loading message
      AnimatedSnackBar.material(
        'Updating profile...',
        type: AnimatedSnackBarType.info,
        duration: const Duration(seconds: 1),
      ).show(context);

      // Update contact info
      context.read<ContactInfoCubit>().editContactInfo(
            address: _addressController.text,
            phone: _phoneController.text,
            facebook: _facebookController.text,
            linkedIn: _linkedInController.text,
          );
    } else {
      AnimatedSnackBar.material(
        'Please correct the errors in the form',
        type: AnimatedSnackBarType.warning,
      ).show(context);
    }
  }
}
