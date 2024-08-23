import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class HistoryListViewItem extends StatefulWidget {
  const HistoryListViewItem({super.key});

  @override
  State<HistoryListViewItem> createState() => _HistoryListViewItemState();
}

class _HistoryListViewItemState extends State<HistoryListViewItem> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.only(start: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  "assets/images/video.png",
                  width:context.width * 252 / 430,
                  height:context.height * 154.0 / 932.0,
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
            style: AppStyles.regular12(context)
                .copyWith(fontFamily: "Poppins", color: const Color(0xff6A6A6A)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
