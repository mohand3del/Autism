

import 'package:autism/core/di/di.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_back_arrow.dart';

import 'package:flutter/material.dart';


import 'confirm_password_widget.dart';

class NewPasswordViewBody extends StatelessWidget {
   NewPasswordViewBody({super.key, required this.email});
  String email;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

            children: [
              const CustomBackArrow(),
              verticalSpace(context.height * 0.042),
              Text("CreateNew Password", style: AppStyles.medium24(context).copyWith(
                color: Colors.black,
                fontFamily: 'Inter',
              )),
              verticalSpace(context.height * 0.012),
              Align(
                alignment: Alignment.center,
                child: Text("You’re New Password must different\n                   Previous Password", style: AppStyles.regular18(context).copyWith(
                  color: const Color(0xff606268),
                  fontFamily: 'Lato',
                )),
              ),
              verticalSpace(context.height * 0.077),
               ConfirmPasswordWidget(email: email,),
              verticalSpace(context.height * 0.1),

             //  CustomBottom(text: "Reset Password", onPressed: (){
             // validateThenDoNewPassword(context);
             //  })



            ],
          ),
    );
  }

}
