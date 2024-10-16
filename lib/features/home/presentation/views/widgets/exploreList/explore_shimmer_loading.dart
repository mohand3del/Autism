
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExploreShimmerLoding extends StatelessWidget {
  const ExploreShimmerLoding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: context.width * 320 / 430,
              height: context.height * 200.0 / 932.0,
              color: Colors.white,
            ),
          ),
          verticalSpace(context.height * 8 / 932),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: context.width * 220 / 430,
              height: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
