

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:flutter/material.dart';

class ChannelListViewItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final FullDatum? channels;

  const ChannelListViewItem({super.key, required this.itemIndex,
    required this.selectedIndex,  this.channels,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? context.width * 20 / 430 : context.width * 44 / 430),
      child: Column(
        children: [

              CircleAvatar(
                radius: 28,
                backgroundColor:AppColors.primaryColor,
                child: Image.network(
                  channels?.thumbnails.medium.url ?? "https://i.ytimg.com/vi/TJuwhCIQQTs/mqdefault.jpg",
                  height: context.height * 70 / 932,
                  width: context.width * 70 / 430,
                ),
              )
          ,
          verticalSpace(8),
          Text(
            channels?.title ?? "Autism",
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
