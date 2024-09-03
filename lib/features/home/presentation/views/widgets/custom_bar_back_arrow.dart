

import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBarBackArrow extends StatelessWidget {
  const CustomBarBackArrow({super.key,  this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.height * 33 / 852,
            left: context.width * 35/ 393,
          ),
          child: InkWell(
            onTap: () {
            GoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        const Spacer(),
        Padding(
          padding:  EdgeInsets.only(top: context.height * 33 / 852, left: context.width * 20/ 393, ),
          child: Text(title??"",style: AppStyles.medium24(context),),
        ),
        const Spacer(flex: 2,)
      ],
    );
  }
}
