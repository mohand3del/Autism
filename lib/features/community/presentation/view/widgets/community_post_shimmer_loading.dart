
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'community_post.dart';

class CommunityPostShimmerLoading extends StatelessWidget {
  const CommunityPostShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
        enabled: true,
        child: CommunityPost());
  }
}
