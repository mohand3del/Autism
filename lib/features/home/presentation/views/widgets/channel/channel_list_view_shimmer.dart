import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';


class ChannelListViewItemShimmer extends StatelessWidget {
  const ChannelListViewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey[300],
            ),
          ),
          verticalSpace(8),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: context.width * 70 / 430,
              height: 16.0,
              color: Colors.grey[300],
            ),
          ),
        ],

    );
  }
}
