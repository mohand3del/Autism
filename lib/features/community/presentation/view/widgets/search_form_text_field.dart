

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SearchFormTextField extends StatelessWidget {
  const SearchFormTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextFormField(

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20,top: 8),
            hintText: 'Search',
            hintStyle: AppStyles.regular16(context).copyWith(
              color: AppColors.grey,
              fontFamily: 'Poppins',
            ),
            border: OutlineInputBorder(

              borderSide: const BorderSide(
                color: AppColors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(27),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(27),
            ),
            focusedBorder: OutlineInputBorder(

              borderSide: const BorderSide(
                color: AppColors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(27),
            ),
          ),
        ),
      ),
    );
  }
}
