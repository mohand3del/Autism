import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

import 'explore_list_view_item.dart';

class ExploreListView extends StatelessWidget {
  const ExploreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: context.height * 240 / 932,

      child: ListView.builder(itemBuilder: (context, index) {
      
        return  const ExploreListViewItem();
      }, itemCount: 10, scrollDirection: Axis.horizontal,),
    );
  }
}
