

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';

class OAuthWidget extends StatelessWidget {
  const OAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
            width: context.width * 0.18,
            height: context.height * 0.066,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color:AppColors.lightGrey,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Center(
              child: Stack(children: [
                Image.asset('assets/images/google.png'),

              ]),
            ),
          ),
        ),
        horizontalSpace(context.width * 0.06),
        Container(
          width: context.width * 0.18,
          height: context.height * 0.066,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color:AppColors.lightGrey,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Center(
            child: Stack(children: [
              Image.asset('assets/images/Facebook.png'),

            ]),
          ),
        ),

      ],
    );
  }

  }

