

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/features/community/presentation/view/create_post_view.dart';
import 'package:autism/features/community/viewModel/create_post_cubit/create_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

import 'create_post_view_body.dart';

class CreatePostBlocListener  extends StatefulWidget {
  const CreatePostBlocListener ({super.key});

  @override
  State<CreatePostBlocListener> createState() => _CreatePostBlocListenerState();
}

class _CreatePostBlocListenerState extends State<CreatePostBlocListener>  with SingleTickerProviderStateMixin {
  @override
  late AnimationController _animationController;

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
    return BlocListener<CreatePostCubit, CreatePostState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        print(state);
        state.whenOrNull(

          loading: () {

            setupLoadingState(context);
          },
          success: (data) {
            setupSuccessState(context, data.message);
          },
          error: (error) {
            setupErrorState(context, error.toString());

          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Sorry, $error',
    );
  }

  void setupLoadingState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          Center(
            child: SpinKitFadingCube(
              color: AppColors.primaryColor,
              size: 50.0,
              controller: _animationController,
            ),
          ),
    );
    _animationController.repeat();
  }
  setupSuccessState(BuildContext context,String success) {
    context.pop();
    QuickAlert.show(

      context: context,
      type: QuickAlertType.success,
      title: 'Post Created Success',
      confirmBtnColor: Colors.blue,
      text: success,
    );
  }
}