import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChannelListViewItem extends StatelessWidget {
  final int? itemIndex;
  final int? selectedIndex;
  final FullDatum? channels;

  const ChannelListViewItem({
    super.key,
    this.itemIndex,
    this.selectedIndex,
    this.channels,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: itemIndex == 0
              ? context.width * 20 / 393
              : context.width * 30 / 393),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  25.0), // Same radius as the CircleAvatar
              child: CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
                imageUrl: channels!.thumbnails.medium.url,

                errorWidget: (context, url, error) => const Icon(Icons.error),
                fadeInDuration: const Duration(milliseconds: 500),
                fit: BoxFit.cover,
                height: context.height * 70 / 932,
                width: context.width * 70 / 430, // Adjust fit as needed
              ),
            ),
          ),
          verticalSpace(8),
          Text(
            Helper.limitWords(channels?.title ?? "Autism", 1),
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
