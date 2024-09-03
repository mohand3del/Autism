import 'package:flutter/material.dart';

import 'channel_card_shimmer.dart';

class ShimmerListView extends StatelessWidget {
  final int itemCount;

  const ShimmerListView({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const ChannelCardShimmer();
      },
    );
  }
}
