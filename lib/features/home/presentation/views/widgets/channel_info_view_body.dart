

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/channel_info_bloc_builder.dart';
import 'package:autism/features/home/presentation/views/widgets/channel_info_card.dart';
import 'package:autism/features/home/presentation/views/widgets/channel_videos_item.dart';
import 'package:autism/features/home/presentation/views/widgets/channel_videos_list_view.dart';
import 'package:flutter/material.dart';

import 'custom_bar_back_arrow.dart';

class ChannelInfoViewBody extends StatelessWidget {
  const ChannelInfoViewBody({super.key, this.channelId});
  final String? channelId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const CustomBarBackArrow(),
        verticalSpace(context.height * 23 / 852),
        const ChannelInfoBlocBuilder(),
        verticalSpace(context.height * 24 / 852),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: Text("Videos",style: AppStyles.regular18(context).copyWith(
            fontFamily: "Poppins",
            color: AppColors.primaryColor,
          ),),
        ),
        verticalSpace(context.height * 10 / 852),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: context.width * 24 / 393),
          child: const Divider(),
        ),
        verticalSpace(context.height * 20 / 852),
        //ChannelVideosItem(),
        const ChannelVideosListView()




      ],
    ));
  }
}
