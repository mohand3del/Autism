

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreRow extends StatelessWidget {
  const ExploreRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width * 24 / 430),
      child: Row(
        children: [
          Text('Explore',style: AppStyles.medium24(context).copyWith(
            fontFamily: "Poppins",

          ),),
          const Spacer(),
          InkWell(
            onTap: (){
              context.push("/explore");
            },
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
