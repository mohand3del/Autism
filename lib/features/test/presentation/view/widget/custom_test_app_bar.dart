import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Removes default back button if needed
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          // Left Side: Profile Picture
          SizedBox(
            height:context.height * 50 / 852,
            width:context.width * 50 / 393,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 28,
              child: SizedBox(
                height:context.height * 50 / 852,
                width:context.width * 50 / 393,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.network(

                          "https://media.istockphoto.com/id/1451587807/vector/user-profile-icon-vector-avatar-or-person-icon-profile-picture-portrait-symbol-vector.jpg?s=1024x1024&w=is&k=20&c=ZVVVbYUtoZgPqbVSDxoltjnrW3G_4DLKYk6QZ0uu5_w="),
                ),
              ),
            ),
          ),

          const Spacer(
            flex: 1,
          ),
          Text(
           title ?? "User",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(
            flex: 10,
          ),
          IconButton(
            icon:  Center(child: SvgPicture.asset('assets/images/test_history_icon.svg')),
            onPressed: () {
              // Action when clock icon is pressed
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56); // Standard AppBar height
}
