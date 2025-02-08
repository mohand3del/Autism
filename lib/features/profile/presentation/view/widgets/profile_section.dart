import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/features/profile/data/model/row_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection(
      {super.key,
      required this.leadingIcon,
      required this.text,
      this.trailingIcon,
      required this.onTap, required RowProfileModel rowProfileModel});
  final String leadingIcon;
  final String text;
  final IconData? trailingIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Icon(leadingIcon, size: 24, color: Colors.black),
                SvgPicture.asset(leadingIcon, width: 24, height: 24),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: AppStyles.regular16(context).copyWith(
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios_outlined,
                size: 24, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
