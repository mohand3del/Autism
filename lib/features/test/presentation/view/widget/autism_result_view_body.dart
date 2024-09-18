

import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/home/presentation/views/widgets/custom_bar_back_arrow.dart';
import 'package:flutter/material.dart';

class AutismResultViewBody extends StatelessWidget {
  const AutismResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Column(
          children: [
            CustomBarBackArrow(title: 'Test Result'),
            verticalSpace(context.height * 42 / 851),
            Image.asset('assets/images/have_autism.png',
                width: context.width * 175 / 393,
                height: context.height * 205 / 851),
            verticalSpace(context.height * 28 / 851),
            Text('Result,you have autism',
              textAlign: TextAlign.center,
              style: AppStyles.semiBold24(context).copyWith(
                  color: Colors.black,
                fontFamily: 'Poppins'
              ),
              ),
            verticalSpace(context.height * 8 / 851),
            Text('Moderate Autism',
              textAlign: TextAlign.center,
              style: AppStyles.medium20(context).copyWith(
                  color: Colors.grey,
                  fontFamily: 'Poppins'
              ),
            ),
            verticalSpace(context.height * 23 / 851),
            SizedBox(
              width: context.width * 150 / 393,
              height: context.height * 50 / 851,
              child: MaterialButton(onPressed: (){},
                elevation: 1,
                color: Colors.white,
                minWidth: context.width * 315 / 393,
                height: context.height * 50 / 851,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Center(
                        child: Image(image: AssetImage('assets/images/download.png'),
                          width: context.width * 20 / 393,
                          height: context.height * 20 / 851,
                        ),
                      ),
                    horizontalSpace(context.width * 5 / 393),


                    Text('Download ',
                      textAlign: TextAlign.center,
                      style: AppStyles.medium16(context).copyWith(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600

                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(context.height * 100 / 851),
            CustomBottom(text: "Recommended Videos", onPressed: (){})

          ],
        )
    );
  }
}
