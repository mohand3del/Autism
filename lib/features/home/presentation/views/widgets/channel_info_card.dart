import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/channel_by_id_response_body.dart';
import 'package:flutter/material.dart';

class ChannelCard extends StatelessWidget {
  const ChannelCard({super.key, this.data});
  final FullData? data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circle Avatar with Image
              CircleAvatar(
                radius: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                   data?.channel.thumbnails.high.url ?? "https://via.placeholder.com/150",
                  ),
                ),
                // Replace with your image URL
              ),
              horizontalSpace(context.width * 12 / 393),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  Helper.limitWords(data?.channel.title, 2),
                    style: AppStyles.semiBold18(context).copyWith(
                      fontFamily: 'Poppins',
                    )
                  ),
                 verticalSpace(context.height * 2 / 852),

                  Text(
                   "${data?.channel.customUrl} ",
                    style: AppStyles.regular12(context).copyWith(
                      fontFamily: 'Poppins',
                      color: const Color(0xff828A97),
                    )
                  ),
                  verticalSpace(context.height * 2 / 852),
                  // Subscriber and Video Count
                  Row(
                    children: [
                      Text(
                        '${Helper.formatNumber('${data?.channel.subscriberCount}')} subscribers • ',
                        style: AppStyles.regular14(context).copyWith(
                          fontFamily: 'Poppins',
                          color: const Color(0xff828A97),
                        ),
                      ),
                       horizontalSpace(context.width * 2 / 393),
                      Text(
                        '${data?.channel.videoCount} videos',
                        style:  AppStyles.regular14(context).copyWith(
                          fontFamily: 'Poppins',
                          color: const Color(0xff828A97),
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          verticalSpace(context.height * 10 / 852),
          // Channel Description
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                 //Helper.limitWordsV2( '${data?.channel.description}', 15,wordsPerLine: 8),
                          '${data?.channel.description}',
                  style: AppStyles.regular14(context).copyWith(
                    fontFamily: 'Poppins',
                    color: const Color(0xff828A97),
                          
                  ),
                  maxLines: 6,
                  softWrap: true, // هذا هو الخيار الافتراضي بالفعل
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
