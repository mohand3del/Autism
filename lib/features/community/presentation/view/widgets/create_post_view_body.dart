import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/community/presentation/view/widgets/add_image_row.dart';
import 'package:autism/features/community/presentation/view/widgets/custom_Selection_button.dart';
import 'package:flutter/material.dart';

class CreatePostViewBody extends StatelessWidget {
  const CreatePostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
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
                    radius: 25, // Profile image size
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
            CustomSelectionButton(
              label: 'Video type',
              onPressed: () => _showCategoryBottomSheet(context, 'Video type'),
            ),
            CustomSelectionButton(
              label: 'Post type',
              onPressed: () => _showCategoryBottomSheet(context, 'Post type'),
            ),
            verticalSpace(context.height * 12 / 852),
            TextField(
              maxLines: 12,
              decoration: InputDecoration(
                hintStyle: AppStyles.regular20(context).copyWith(
                  color: AppColors.grey,
                ),
                hintText: 'What‘s on your mind ?',
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
            verticalSpace(context.height * 12 / 852),
            const AddImageRow(),
            verticalSpace(context.height * 12 / 852),
          ],
        ),
      ),
    );
  }

  void _showCategoryBottomSheet(BuildContext context, String selectionType) {
    List<String> options = [];

    if (selectionType == 'Video type') {
      options = [
        'People & Blogs',
        'Education',
        'Science & Technology',
        'Non profits & Autism',
        'Documentary',
      ];
    } else if (selectionType == 'Post type') {
      options = [
        'Question',
        'Advice',
      ];
    }

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: options.map((option) {
              return ListTile(
                title: Text(
                  option,
                  style: AppStyles.regular22(context),
                ),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint('Selected $option');
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
