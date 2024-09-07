

import 'package:autism/features/home/presentation/views/widgets/recommended_video_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendedVideoSkeleton extends StatelessWidget {
  const RecommendedVideoSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Skeletonizer(
            enabled: true,
            child: RecommendedVideoItem(videoData: null,)) );


  }
}
