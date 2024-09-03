

import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'home_explore_list_view_item.dart';

class CustomSkeletonizerListView extends StatelessWidget {
  const CustomSkeletonizerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: context.height * 240 / 932,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Skeletonizer(
            enabled: true,
            child: ExploreListViewItem(
              fullDatum: null,
            ),
          );
        },
      ),
    );
  }
}
