
import 'package:autism/features/home/presentation/views/widgets/channel/channel_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonChannelList extends StatelessWidget {
  const CustomSkeletonChannelList({super.key,required this.scrollDirection});
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Skeletonizer(
              enabled: true,
              child:  ChannelListViewItem(itemIndex: 1,selectedIndex: 0,channels:null,)) ;
        },
      ),
    );
  }
}
