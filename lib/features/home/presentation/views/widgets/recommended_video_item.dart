

import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/home/data/model/video_by_id_response_body.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/spacing.dart';

class RecommendedVideoItem extends StatelessWidget {
  const RecommendedVideoItem({super.key, this.videoData});

  final FullDatum? videoData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // The image
        Image.network(
          videoData?.vedio.thumbnails.medium.url ??
              "https://i.ytimg.com/vi/TJuwhCIQQTs/mqdefault.jpg",
          width: double.infinity,
          height: context.height * 213 / 852,
          fit: BoxFit.cover,
        ),
        // The text and other elements container
        Container(
          width: 393,
          color: Colors.white.withOpacity(0.7),
          padding:  EdgeInsets.only(top: context.height * 6 / 852,bottom: context.height * 12 / 852),
          child: Padding(
            padding:  EdgeInsets.only(left:context.width * 8 / 393),
            child: Row(
              children: <Widget>[
                // The icon (optional)
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  // Same radius as the CircleAvatar
                  child: FadeInImage.assetNetwork(

                    placeholder: 'assets/images/Ellipse 22.png',
                    image: videoData?.channel.thumbnails.medium.url ?? "https://via.placeholder.com/150",
                    fit: BoxFit.cover,
                    height: context.height * 50 / 932,
                    width: context.width * 50 / 430, // Adjust fit as needed
                  ),
                ),

                horizontalSpace(context.width * 10 / 393),
                // The text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        Helper.limitWords(
                            videoData?.vedio.title ??
                                "About Autism 101: Your Beginner Guide",
                            5),
                        style: AppStyles.medium15(context).copyWith(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Row(
                        children: [
                          Text(Helper.limitWords(videoData?.channel.title ?? "Autism", 3),
                              style: AppStyles.regular12(context).copyWith(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                              )),
                          horizontalSpace(context.width * 10 / 393),
                          Text(
                              Helper.limitWords(
                                  videoData?.vedio.publishedAt.toString() ?? "1 hour ago", 1),
                              style: AppStyles.regular12(context).copyWith(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
