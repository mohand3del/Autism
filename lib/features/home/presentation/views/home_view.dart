
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.white,
        body:  HomeViewBody());
  }
}
