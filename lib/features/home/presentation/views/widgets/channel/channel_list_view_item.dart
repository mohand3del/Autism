

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:flutter/material.dart';

class ChannelListViewItem extends StatelessWidget {
  final int? itemIndex;
  final int? selectedIndex;
  final FullDatum? channels;

  const ChannelListViewItem({super.key,  this.itemIndex,
     this.selectedIndex,  this.channels,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? context.width * 20 / 430 : context.width * 44 / 430),
      child: Column(
        children: [

        CircleAvatar(
        radius: 25,
        backgroundImage: const NetworkImage(
          'https://via.placeholder.com/150', // Replace with your image URL
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0), // Same radius as the CircleAvatar
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/Ellipse 22.png', // Replace with a local placeholder image
            image: channels?.thumbnails.medium.url ?? "https://via.placeholder.com/150",
            fit: BoxFit.cover,
            height: context.height * 70 / 932,
            width: context.width * 70 / 430,// Adjust fit as needed
          ),
        ),
      ),

          verticalSpace(8),
          Text(
          Helper.limitWords(  channels?.title ?? "Autism", 1),
            style: AppStyles.regular12(context).copyWith(
              color: AppColors.black,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
