

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/custom_bar_back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NonAutismViewBody extends StatelessWidget {
  const NonAutismViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Column(
      children: [
        const CustomBarBackArrow(title: 'Test Result'),
        verticalSpace(context.height * 62 / 851),
        Image.asset('assets/images/non_autism.png',
            width: context.width * 150 / 393,
            height: context.height * 172 / 851),
        verticalSpace(context.height * 28 / 851),
        Text('Result,you have not autism',
          textAlign: TextAlign.center,
          style: AppStyles.semiBold24(context).copyWith(
              color: Colors.black,
              fontFamily: 'Poppins'
          ),
        ),
        verticalSpace(context.height * 45 / 851),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Do you want to repeat the test? ",
              style: AppStyles.medium14(context).copyWith(
                  color: Colors.grey,
                  fontFamily: 'Poppins'
              ),
            ),
            GestureDetector(
              onTap: (){
                context.go('/test');
              },
              child: Text("Repeat test ",
                style: AppStyles.medium14(context).copyWith(
                    color: AppColors.primaryColor,
                    fontFamily: 'Poppins'
                ),
              ),
            ),
          ],
        )

      ],
    ));
  }
}
