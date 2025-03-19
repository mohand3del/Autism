import 'package:flutter/material.dart';

import 'edit_profile_text_form_feild.dart';

class ContactProfileFileds extends StatefulWidget {
  const ContactProfileFileds(
      {super.key,
      required this.addressController,
      required this.phoneNumberController,
      required this.facebookController,
      required this.linkedInController,
      required this.formKey});

  final TextEditingController addressController;
  final TextEditingController phoneNumberController;
  final TextEditingController facebookController;
  final TextEditingController linkedInController;

  final GlobalKey<FormState> formKey;

  @override
  State<ContactProfileFileds> createState() => _ContactProfileFiledsState();
}

class _ContactProfileFiledsState extends State<ContactProfileFileds> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditableTextField(
          controller: widget.addressController,
          label: 'Address',
          validator: (value) => _validateField(value, 'Address'),
        ),
        EditableTextField(
          controller: widget.phoneNumberController,
          label: 'Phone Number',
          validator: (value) => _validateField(value, 'Phone Number'),
        ),
        EditableTextField(
          controller: widget.facebookController,
          label: 'Facebook',
          validator: (value) => _validateField(value, 'Facebook'),
        ),
        EditableTextField(
          controller: widget.linkedInController,
          label: 'LinkedIn',
          validator: (value) => _validateField(value, 'LinkedIn'),
        ),
      ],
    );
  }

  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }
}
