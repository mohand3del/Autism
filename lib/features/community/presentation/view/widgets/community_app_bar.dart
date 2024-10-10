import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class CommunityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommunityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false, // To remove the default back button
      title: Row(
        children: [
          // Profile Image
          SizedBox(
            height: context.height * 54 / 852,
            width:context.width * 54 / 393,
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://example.com/profile.jpg', // Replace with actual image URL or asset
              ),
              radius: 20, // Adjust the size as needed
            ),
          ),
        horizontalSpace(context.width * 10 / 393),
          Text("Mohand",
          style: AppStyles.medium20(context).copyWith(
            color: Colors.black,
            fontFamily: 'Poppins',
          ),),
          const Expanded(child: SizedBox()),

          Stack(
            children: [
              IconButton(
                icon: Image.asset('assets/images/bellIcon.png'),
                onPressed: () {
                  // Handle notification icon click
                },
              ),
              Positioned(
                right: 12,
                top: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Column(
          children: [
             const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.dividerColor,
            ),
            verticalSpace(context.height * 14 / 852),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon for categories
                  IconButton(
                    icon: const Icon(Icons.inventory_2_outlined, color: Colors.blue,size: 34,),
                    onPressed: () {
                      // Handle category icon click
                    },
                  ),

                  // Search Bar
                  Container(
                    height: context.height * 40 / 852,
                    width: context.width * 222 / 393,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(color: AppColors.formFieldBorder),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Add Post?",
                          style: AppStyles.regular14(context).copyWith(
                            color: AppColors.black,
                            fontFamily: 'Inter',

                          ),

                        ),
                      ),
                    ),
                    // Add any other desired properties for the container
                  ),


                  IconButton(
                    icon:   Image.asset('assets/images/search_icon.png'),
                    onPressed: () {
                      // Handle filter icon click
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(134.0); // Set the height for your AppBar
}
