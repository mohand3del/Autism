import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/channel_by_id_response_body.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChannelVideosItem extends StatelessWidget {
  const ChannelVideosItem({super.key, this.videoData});
  final Video? videoData;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: context.width * 24 / 393,right: context.width * 24 / 393,bottom:context.height * 15 / 852),
      child: Row(
        children: [
          // Video Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage( // Replace with your image URL
              width: context.width *  170 / 393,
              height: context.height * 100 / 852,
              fit: BoxFit.cover,
              imageUrl: videoData?.thumbnails.high.url ?? "",
              placeholder: (context, url) =>  Skeletonizer(child: Container()),
              errorWidget: (context, url, error) => const Icon(Icons.error),),
          ),
          horizontalSpace(context.width * 8 / 393),
          // Video Details
          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Title
                Text(
                 Helper.limitWords( videoData?.title, 10) ?? 'What is autism and how \n can we help them?',
                  style: AppStyles.regular12(context).copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,

                  )
                ),

                verticalSpace(context.height * 12 / 852),
                // Video Views and Time
                Row(
                  children: [
                    Text(
                    Helper.formatNumber('${videoData?.viewCount}') + 'views •',
                      //'${videoData?.viewCount}views •',
                      style: AppStyles.regular10(context).copyWith(
                        fontFamily: 'Poppins',
                        color: Color(0xff828A97)
                      ),

                    ),
                    horizontalSpace(context.width * 2 / 393),
                    Text(
                      Helper.limitWords(videoData?.publishedAt.toString(), 1),
                      style: AppStyles.regular10(context).copyWith(
                          fontFamily: 'Poppins',
                          color: Color(0xff828A97)
                      ),

                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}