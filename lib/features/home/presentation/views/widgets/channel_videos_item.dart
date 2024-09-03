import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class ChannelVideosItem extends StatelessWidget {
  const ChannelVideosItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: context.width * 24 / 393,right: context.width * 24 / 393,bottom:context.height * 15 / 852),
      child: Row(
        children: [
          // Video Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("assets/images/video.png", // Replace with your image URL
              width: context.width *  170 / 393,
              height: context.height * 100 / 852,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(context.width * 8 / 393),
          // Video Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Title
                Text(
                  'What is autism and how \n can we help them?',
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
                      '1M views • ',
                      style: AppStyles.regular10(context).copyWith(
                        fontFamily: 'Poppins',
                        color: Color(0xff828A97)
                      ),

                    ),
                    horizontalSpace(context.width * 2 / 393),
                    Text(
                      '2 years ago',
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