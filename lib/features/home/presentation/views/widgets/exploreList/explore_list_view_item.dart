
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:flutter/material.dart';

class ExploreListViewItem extends StatelessWidget {
   const ExploreListViewItem({super.key, this.fullDatum});
  final FullDatum? fullDatum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  fullDatum?.vedio.thumbnails.medium.url ?? "https://i.ytimg.com/vi/TJuwhCIQQTs/mqdefault.jpg",
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
                    color: Colors.white.withOpacity(0.7),
                    size: 48.0,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(context.height * 8 / 932),
          Expanded(
            child: Text(
              fullDatum?.vedio.title ?? "About Autism 101: Your Beginner Guide",
              style: AppStyles.regular13(context)
                  .copyWith(fontFamily: "Poppins", color: const Color(0xff6A6A6A)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
