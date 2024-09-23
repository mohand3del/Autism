

import 'package:autism/features/resource/presentation/view/widget/resource_list_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ResourceShimmer extends StatelessWidget {
  const ResourceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => const Skeletonizer(
              enabled: true,
              child: ResourceListItem() )),
    );

  }
}
