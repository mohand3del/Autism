


import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:flutter/material.dart';

import 'community_post.dart';

class CommunityPostListView extends StatelessWidget {
  const CommunityPostListView({super.key, this.data});
  final List<Datum>? data;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
      return  CommunityPost(
        data: data![index],
      );
    }));
  }
}
