import 'dart:async';
import 'dart:developer';

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/widgets/custom_bottom.dart';
import 'package:autism/features/auth/forgetPass/view%20model/forget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../view model/verify_cubit.dart';

class PinCodeFields extends StatefulWidget {
  PinCodeFields({super.key, this.otpCode, this.email});

  String? otpCode;
  String? email;

  @override
  State<PinCodeFields> createState() => _PinCodeFieldsState();
}

class _PinCodeFieldsState extends State<PinCodeFields> {
  bool isLoading = false;
  int _start = 60;
  late Timer _timer;


  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();

            isLoading = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();

  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<VerifyCubit>().formKey,

      child: BlocProvider(
        create: (BuildContext context) => getIt<ForgetCubit>(),
        child: Column(
          children: [
            PinCodeTextField(
              //keyboardType: ,
              controller: context.read<VerifyCubit>().code,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(6),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.primaryColor,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                disabledColor: Colors.white,
                borderWidth: 0.1,
                activeBorderWidth: 1.5,
                inactiveBorderWidth: 1.5,
                selectedBorderWidth: 1.5,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.white,

              // enableActiveFill: true,
              //errorAnimationController: errorController,
              //controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (code) {
                widget.otpCode = code;
                print(code);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the OTP code';
                } else if (value.length != 6) {
                  return 'OTP code must be 6 digits';
                }
                return null;
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
              appContext: context,
            ),
            Row(

              children: [
                Text(
                  _start.toString(),
                  style: AppStyles.medium14(context).copyWith(
                    color: AppColors.primaryColor,
                    fontFamily: "Inter",
                  ),
                ),
                Spacer(),
                Text(
                  "I didn't receive any code.",
                  style: AppStyles.medium14(context).copyWith(
                    color: AppColors.grey,
                    fontFamily: "Inter",
                  ),
                ),
                InkWell(
                  onTap: () {
                    validateThenDoResend(context);
                    if (_start == 0) {
                      setState(() {
                        _start = 60;
                        startTimer();
                      });

                    //  validateThenDoResend(context);

                    }
                  },
                  child: Text(
                    " Resend",
                    style: AppStyles.medium14(context).copyWith(
                      color: AppColors.primaryColor,
                      fontFamily: "Inter",
                    ),
                  ),
                ),


              ],
            ),
            verticalSpace(context.height * 0.118),
            CustomBottom(
              text: "Verify",
              onPressed: () {
                if (context.read<VerifyCubit>().formKey.currentState!.validate()) {
                  validateTheDoVerify(context);

                  log("email is============================================ ${widget.email}");
                }
              },
            ),

          ],
        ),
      ),
    );
  }


  void validateThenDoResend(BuildContext context) {
    context.read<ForgetCubit>().emailController.text = widget.email!;
      context.read<ForgetCubit>().emitForgetState();



  }


    void validateTheDoVerify(BuildContext context) {
    if (context.read<VerifyCubit>().formKey.currentState!.validate()) {
      if (widget.otpCode != null || widget.otpCode!.isNotEmpty) {

        context
            .read<VerifyCubit>()
            .codeController = widget.otpCode;
        context.read<VerifyCubit>().emailController = widget.email;
        context.read<VerifyCubit>().emitVerifyState();
        context.read<VerifyCubit>().verifyCode(widget.otpCode!)
            .then((isCodeValid) { // isCodeValid will be true or false
          if (isCodeValid == true) {
            context.go("/newPassword",extra:widget.email);

          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Missing OTP Code'),
                content: Text('Please enter the OTP code sent to your email.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );

          }
        });
      } else {
        // Handle missing OTP code
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Missing OTP Code'),
            content: Text('Please enter the OTP code sent to your email.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }


}
