import 'package:autism/features/profile/presentation/view/widgets/edit_profile_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileFields extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController genderController;
  final TextEditingController dateOfBirthController;
  final GlobalKey<FormState> formKey;

  const ProfileFields({
    super.key,
    required this.nameController,
    required this.genderController,
    required this.dateOfBirthController,
    required this.formKey,
  });

  @override
  State<ProfileFields> createState() => _ProfileFieldsState();
}

class _ProfileFieldsState extends State<ProfileFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditableTextField(
          controller: widget.nameController,
          label: 'Full Name',
          validator: (value) => _validateField(value, 'Full Name'),
        ),
        EditableTextField(
          controller: widget.genderController,
          label: 'Gender',
          validator: (value) => _validateField(value, 'Gender'),
        ),
        _buildDateField(context),
      ],
    );
  }

  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    if (fieldName == 'Full Name' && value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (fieldName == 'Gender' &&
        !['male', 'female',].contains(value.toLowerCase())) {
      return 'Please enter male, female';
    }
    if (fieldName == 'Date of Birth' && value == 'Select Date') {
      return 'Please select a date of birth';
    }
    return null;
  }

  Widget _buildDateField(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: IgnorePointer(
        child: EditableTextField(
          controller: widget.dateOfBirthController,
          label: 'Date of Birth',
          validator: (value) => _validateField(value, 'Date of Birth'),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime initialDate =
          widget.dateOfBirthController.text != 'Select Date'
              ? DateTime.parse(widget.dateOfBirthController.text)
              : DateTime.now();

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (picked != null) {
        setState(() {
          widget.dateOfBirthController.text =
              DateFormat('yyyy-MM-dd').format(picked);
          widget.formKey.currentState?.validate(); // Re-validate after change
        });
      }
    } catch (e) {
      _showFallbackDatePicker(context);
    }
  }

  Future<void> _showFallbackDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        widget.dateOfBirthController.text =
            DateFormat('yyyy-MM-dd').format(picked);
        widget.formKey.currentState?.validate(); // Re-validate after change
      });
    }
  }
}
