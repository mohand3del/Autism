


import 'package:flutter/material.dart';

import 'community_post.dart';

class CommunityPostListView extends StatelessWidget {
  const CommunityPostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
      return const CommunityPost();
    }));
  }
}
