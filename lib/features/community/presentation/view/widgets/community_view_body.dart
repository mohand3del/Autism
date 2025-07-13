import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/community/presentation/view/widgets/show_all_posts_bloc_builder.dart';
import 'package:autism/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // CommunityPostListView()
          const CustomHomeAppBar(
            showWelcome: false,
            assetPath: 'assets/images/bello.svg',
            onIconPressed: null, // No action defined for the icon
          ),
          verticalSpace(context.height * 0.013),
          const Divider(),
          verticalSpace(context.height * 20 / 852),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon for categories
                IconButton(
                  icon: const Icon(
                    Icons.inventory_2_outlined,
                    color: Colors.blue,
                    size: 34,
                  ),
                  onPressed: () {
                    // Handle category icon click
                  },
                ),

                // Search Bar
                InkWell(
                  onTap: () {
                    context.push('/createPost');
                  },
                  child: Container(
                    height: context.height * 40 / 852,
                    width: context.width * 222 / 393,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(color: AppColors.formFieldBorder),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Add Post?",
                          style: AppStyles.regular14(context).copyWith(
                            color: AppColors.black,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                    // Add any other desired properties for the container
                  ),
                ),

                IconButton(
                  icon: Image.asset('assets/images/search_icon.png'),
                  onPressed: () {
                    context.push('/search');
                  },
                ),
              ],
            ),
          ),
          const ShowAllPostsBlocBuilder(),
        ],
      ),
    );
  }
}
