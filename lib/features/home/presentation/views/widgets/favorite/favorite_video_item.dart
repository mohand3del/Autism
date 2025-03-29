import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/favorite_video_response_model.dart';
import 'package:flutter/material.dart';

class FavoriteVideoItem extends StatelessWidget {
  const FavoriteVideoItem({super.key, this.fullDatum});
  final FullData? fullDatum;

  @override
  Widget build(BuildContext context) {
    final video = (fullDatum?.videos.isNotEmpty ?? false)
        ? fullDatum!.videos.first
        : null;
    final channel = (fullDatum?.channels.isNotEmpty ?? false)
        ? fullDatum!.channels.first
        : null;

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
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              // The channel icon
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: channel != null
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/Ellipse 22.png',
                        image: channel.thumbnails.medium.url,
                        fit: BoxFit.cover,
                        height: context.height * 50 / 932,
                        width: context.width * 50 / 430,
                      )
                    : Image.asset(
                        'assets/images/Ellipse 22.png',
                        height: context.height * 50 / 932,
                        width: context.width * 50 / 430,
                        fit: BoxFit.cover,
                      ),
              ),

              horizontalSpace(context.width * 10 / 393),
              // The text
              SizedBox(
                width: context.width * 280 / 393,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      video?.title ?? "About Autism 101: Your Beginner Guide",
                      style: AppStyles.medium15(context).copyWith(
                        fontFamily: 'Poppins',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          channel != null
                              ? Helper.limitWords(channel.title, 3)
                              : "Unknown Channel",
                          style: AppStyles.regular12(context).copyWith(
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                          ),
                        ),
                        horizontalSpace(context.width * 10 / 393),
                        Text(
                          video != null
                              ? Helper.limitWords(
                                  video.publishedAt.toString(), 1)
                              : "Unknown date",
                          style: AppStyles.regular12(context).copyWith(
                            fontFamily: 'Poppins',
                            color: Colors.grey,
                          ),
                        ),
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
