

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'channel_info_card.dart';

class CustomSkeletonCardInfo extends StatelessWidget {
  const CustomSkeletonCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: ChannelCard());
  }
}
