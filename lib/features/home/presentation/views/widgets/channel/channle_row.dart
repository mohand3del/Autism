

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class ChannelRow extends StatelessWidget {
  const ChannelRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width * 24 / 430),
      child: Row(
        children: [
          Text('Channel',style: AppStyles.medium24(context).copyWith(
            fontFamily: "Poppins",

          ),),
          const Spacer(),
          InkWell(
            onTap: (){},
            child: Text('See All',style: AppStyles.regular14(context).copyWith(
              fontFamily: "Poppins",
              color: AppColors.primaryColor,
            ),),
          ),
        ],
      ),
    );
  }
}
