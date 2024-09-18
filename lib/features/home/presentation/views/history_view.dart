

import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/history_view_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.white,
        body: HistoryViewBody());
  }
}
