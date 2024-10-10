import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CreatePostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onPostPressed;
  final String postButtonText;
  final Color postButtonColor;

  CreatePostAppBar({
    required this.title,
    this.onBackPressed,
    this.onPostPressed,
    this.postButtonText = 'Post',
    this.postButtonColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black), // Customize title color if needed
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            width: 91,
            height: 46, // Adjusted height to fit better in the AppBar
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor, // Use your custom primary color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded button corners
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              onPressed: onPostPressed,
              child: Text(
                postButtonText,
                style: TextStyle(
                  color: postButtonColor, // Customize the post button text color
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white, // Optional: Customize background color
      elevation: 0, // Optional: Remove shadow
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
