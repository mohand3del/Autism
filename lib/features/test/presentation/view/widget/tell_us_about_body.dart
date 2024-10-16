import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/core/widgets/custom_text_field.dart';
import 'package:autism/features/test/presentation/view/widget/tell_about_bloc_listeiner.dart';
import 'package:autism/features/test/viewModel/tell_about_cubit/tell_about_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TellUsAboutBody extends StatefulWidget {
  const TellUsAboutBody(
      {super.key, this.totalFormQuestions, required this.selectedMethods,});

  final int? totalFormQuestions;
  final List<String> selectedMethods;


  @override
  State<TellUsAboutBody> createState() => _TellUsAboutBodyState();
}

class _TellUsAboutBodyState extends State<TellUsAboutBody> {


  String? selectedRelation;
  String? selectedGender;
  String? selectedAge;
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      key: context.read<TellAboutCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(context.height * 70 / 852),
            Text(
              "Tell us about your child",
              style: AppStyles.medium22(context).copyWith(),
            ),
            verticalSpace(context.height * 33 / 852),
            SizedBox(
              width: double.infinity,
              child: AppTextFormField(
                  controller: context.read<TellAboutCubit>().nameController,
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  }),
            ),
            verticalSpace(context.height * 16 / 852),

            // Custom Dropdown for Relation to Autism
            customDropdownButton(
              hint: 'Relation to autism',
              value: selectedRelation,
              items: ['Parent', 'Sibling', 'Other'],
              onChanged: (value) {
                setState(() {
                  selectedRelation = value;
                });
              },
            ),
            verticalSpace(context.height * 16 / 852),

            // Custom Dropdown for Gender
            customDropdownButton(
              hint: 'Gender',
              value: selectedGender,
              items: ['Male', 'Female', 'Other'],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            verticalSpace(context.height * 16 / 852),

            // Custom Dropdown for Age
            customDropdownButton(
              hint: 'Age',
              value: selectedAge,
              items: ['1-3', '4-6', '7-10'],
              onChanged: (value) {
                setState(() {
                  selectedAge = value;
                });
              },
            ),
            verticalSpace(context.height * 16 / 852),

            // Custom Dropdown for Location
            customDropdownButton(
              hint: 'Location',
              value: selectedLocation,
              items: ['Egypt', 'France', 'Morocco', 'Middle East'],
              onChanged: (value) {
                setState(() {
                  selectedLocation = value;
                });
              },
            ),
            verticalSpace(context.height * 140 / 852),
            TellAboutBlocListener(
              totalFormQuestions: widget.totalFormQuestions ?? 10,
              selectedMethods: widget.selectedMethods,
            ),
            CustomBottom(
                text: 'Continue',
                onPressed: () {
                  if (context.read<TellAboutCubit>().formKey.currentState!.validate()) {

                    context.read<TellAboutCubit>().emitTellAboutStates(
                          relation: selectedRelation!,
                          gender: selectedGender!,
                          age: selectedAge!,
                          location: selectedLocation!,
                      name: context.read<TellAboutCubit>().nameController.text,
                      selectedMethods: widget.selectedMethods.join(', '),

                        );


                  }
                }),

          ],
        ),
      ),
    ));
  }

  Widget customDropdownButton({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.05,
          vertical: context.height * 4 / 852,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: DropdownButton<String>(
          hint: Text(
            hint,
            style: AppStyles.regular16(context).copyWith(
              color: AppColors.lightGrey,
              fontFamily: 'Inter',
            ),
          ),
          value: value,
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.grey,
          ),
          style: const TextStyle(color: AppColors.grey, fontSize: 16),
          itemHeight: 48,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 14),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          // Use a custom menu with offset to lower the dropdown

          elevation: 2,
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}
