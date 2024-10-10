
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'channel_card_item.dart';

class ChannelSkeletonCard extends StatelessWidget {
  const ChannelSkeletonCard({super.key, required this.scrollDirection,});
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: scrollDirection,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Skeletonizer(
              enabled: true,
              child:  ChannelCardItem(fullDatum: null,));
        },
      ),
    );
  }
}
