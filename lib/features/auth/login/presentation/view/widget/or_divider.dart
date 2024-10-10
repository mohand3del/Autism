import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';


class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width * 0.06),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Divider(
              color:AppColors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "or",
              style:AppStyles.regular22(context).copyWith(
                color: AppColors.grey,

              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.grey,
              thickness: 1,
            ),
          ),

        ],
      ),
    );
  }
}
