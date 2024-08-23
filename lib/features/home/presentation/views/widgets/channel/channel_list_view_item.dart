

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class ChannelListViewItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;

  const ChannelListViewItem({super.key, required this.itemIndex,
    required this.selectedIndex,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? context.width * 20 / 430 : context.width * 44 / 430),
      child: Column(
        children: [

              CircleAvatar(
                radius: 28,
                backgroundColor:AppColors.primaryColor,
                child: Image.asset(
                  'assets/images/Ellipse 22.png',
                  height: context.height * 70 / 932,
                  width: context.width * 70 / 430,
                ),
              )
          ,
          verticalSpace(8),
          Text(
            'Autism',
            style: AppStyles.regular14(context).copyWith(
              color: AppColors.black,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
