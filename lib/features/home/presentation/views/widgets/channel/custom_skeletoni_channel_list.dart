import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonChannelItem extends StatelessWidget {
  final int? itemIndex;
  const SkeletonChannelItem({super.key, this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: itemIndex == 0
            ? context.width * 20 / 393
            : context.width * 30 / 393,
      ),
      child: Column(
        children: [
          Skeleton.leaf(
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          verticalSpace(8),
          Skeleton.leaf(
            child: Container(
              width: context.width * 70 / 430,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSkeletonChannelList extends StatelessWidget {
  final Axis scrollDirection;
  const CustomSkeletonChannelList({super.key, required this.scrollDirection});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: scrollDirection,
          itemCount: 10,
          itemBuilder: (context, index) {
            return  SkeletonChannelItem(itemIndex: index);
          },
        ),
      ),
    );
  }
}