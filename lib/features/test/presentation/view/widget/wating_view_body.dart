import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class WaitingViewBody extends StatelessWidget {
  const WaitingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        verticalSpace(context.height * 128 / 851),
        Image.asset('assets/images/waiting.png',
            width: context.width * 365 / 393,
            height: context.height * 365 / 851),
        Text('Please wait...',
        textAlign: TextAlign.center,
        style: AppStyles.medium20(context).copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w500
        ),),

      ],
    ));
  }
}
