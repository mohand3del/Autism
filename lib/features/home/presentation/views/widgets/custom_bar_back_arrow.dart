import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomBarBackArrow extends StatelessWidget {
  const CustomBarBackArrow({super.key, this.title, this.icon, this.onTap});
  final String? title;
  final IconData? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust spacing between children
      children: [
        // Back Arrow Icon
        Padding(
          padding: EdgeInsets.only(
            top: context.height * 33 / 852,
            left: context.width * 20 / 393, // Adjust left padding here
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),

        // Title Text
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: context.height * 33 / 852,
              left: context.width * 10 / 393, // Adjust left padding here for title
            ),
            child: Align(
              alignment: Alignment.center, // Align the title to center
              child: Text(
                title ?? "",
                style: AppStyles.medium24(context),
              ),
            ),
          ),
        ),

        // Custom Icon
        Padding(
          padding: EdgeInsets.only(
            top: context.height * 33 / 852,
            right: context.width * 20 / 393, // Adjust right padding for the icon
          ),
          child: GestureDetector(
            onTap: onTap,
            child: FaIcon(
              icon,
              color: Colors.red,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }
}
