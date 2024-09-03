

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/home/presentation/views/widgets/channel_info_view_body.dart';
import 'package:flutter/material.dart';

class ChannelInfoView extends StatelessWidget {
  const ChannelInfoView({super.key, this.channelId});
  final String? channelId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ChannelInfoViewBody(),
    );
  }
}
