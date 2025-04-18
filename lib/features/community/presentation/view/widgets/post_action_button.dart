import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class PostActionButton extends StatelessWidget {
  final ImageProvider icon;
  final String text;
  final VoidCallback onTap;

  const PostActionButton({super.key, 
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: icon,
            width: 20,
            height: 20,
          ),
          horizontalSpace(context.width * 2 / 393),
          Text(
            text,
            style:  AppStyles.regular15(context).copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
