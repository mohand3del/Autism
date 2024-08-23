import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class ExploreListViewItem extends StatefulWidget {
  const ExploreListViewItem({super.key});

  @override
  State<ExploreListViewItem> createState() => _ExploreListViewItemState();
}

class _ExploreListViewItemState extends State<ExploreListViewItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  "assets/images/video.png",
                  width: context.width * 320 / 430,
                  height: context.height * 200.0 / 932.0,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white.withOpacity(0.1),
                    size: 48.0,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(context.height * 8 / 932),
          Text(
            "About Atism 101: Your Beginner Guide",
            style: AppStyles.regular15(context)
                .copyWith(fontFamily: "Poppins", color: Color(0xff6A6A6A)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
