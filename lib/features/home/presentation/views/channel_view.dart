


import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_view_body.dart';
import 'package:flutter/material.dart';

class ChannelView extends StatelessWidget {
  const ChannelView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: ChannelViewBody(),
    );
  }
}
