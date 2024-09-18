import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/features/test/presentation/view/widget/test_view_body.dart';

import 'package:autism/features/test/viewModel/tell_about_cubit/tell_about_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class TellAboutBlocListener extends StatefulWidget {
  const TellAboutBlocListener({super.key, required this.totalFormQuestions, required this.selectedMethods});
  final int totalFormQuestions;
  final List<String> selectedMethods;

  @override
  _TellAboutBlocListenerState createState() => _TellAboutBlocListenerState();
}

class _TellAboutBlocListenerState extends State<TellAboutBlocListener> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TellAboutCubit, TellAboutState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: SpinKitFadingCube(
                  color: AppColors.primaryColor,
                  size: 50.0,
                  controller: _animationController,
                ),
              ),
            );
            _animationController.repeat();
          },
          success: (tellAboutResponseBody) {
           // context.pop(); // اغلاق صندوق التحميل أو أي نافذة أخرى مفتوحة
            setupSuccessState(context, 'Operation completed successfully!');

            // بعد إظهار الرسالة، الانتقال إلى الصفحة التالية
            Future.delayed(Duration(seconds: 1), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestViewBody(
                    totalFormQuestions: widget.totalFormQuestions,
                    selectedMethods: widget.selectedMethods,
                  ),
                ),
              );
            });


          },
          error: (error) {
            setupErrorState(context, error);

          },
        );
      },
      child: const SizedBox.shrink(), // Placeholder or actual child widget here
    );
  }


  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: AppStyles.medium16(context).copyWith(
            color: AppColors.black,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: AppStyles.semiBold16(context).copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void setupSuccessState(BuildContext context, String message) {
    context.pop();  // Close any existing dialogs or screens if necessary
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 32,
        ),
        content: Text(
          message,
          style: AppStyles.medium16(context).copyWith(
            color: AppColors.black,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();  // Close the dialog when button is pressed
            },
            child: Text(
              'Okay',
              style: AppStyles.semiBold16(context).copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }


}




