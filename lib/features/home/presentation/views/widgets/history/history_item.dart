import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/history_response_body.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, this.fullData, this.video, this.channel});

  final FullData? fullData;
  final Video? video;
  final Channel? channel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // The image
        Image.network(
          video?.thumbnails.medium.url ??
              "https://i.ytimg.com/vi/TJuwhCIQQTs/mqdefault.jpg",
          width: double.infinity,
          height: context.height * 213 / 852,
          fit: BoxFit.cover,
        ),
        // The text and other elements container
        Container(
          width: 393,
          color: Colors.white.withOpacity(0.7),
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              // The icon (optional)
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                // Same radius as the CircleAvatar
                child: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: channel?.thumbnails.high.url ?? "",
                  fit: BoxFit.cover,
                  height: context.height * 50 / 932,
                  width: context.width * 50 / 430, // Adjust fit as needed
                ),
              ),

              horizontalSpace(context.width * 10 / 393),
              // The text
              Container(
                width: context.width * 280 / 393,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(

                      video?.title ??
                          "About Autism 101: Your Beginner Guide",

                      style: AppStyles.medium15(context).copyWith(
                        fontFamily: 'Poppins',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(Helper.limitWords(fullData?.channels[0].title, 3),
                            style: AppStyles.regular12(context).copyWith(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            )),
                        horizontalSpace(context.width * 10 / 393),
                        Text(
                            Helper.limitWords(
                                video?.publishedAt.toString(), 1),
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
      ],
    );
  }
}
