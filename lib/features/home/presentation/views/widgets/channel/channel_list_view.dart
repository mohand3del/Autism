

import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_list_view_item.dart';
import 'package:flutter/material.dart';

class ChannelListView extends StatefulWidget {
  const ChannelListView({super.key, required this.fullData});
  final List<FullDatum?> fullData;

  @override
  State<ChannelListView> createState() => _ChannelListViewState();
}

class _ChannelListViewState extends State<ChannelListView> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            itemCount: widget.fullData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {

          return  ChannelListViewItem(itemIndex: index,selectedIndex: selectedIndex,channels: widget.fullData[index],);
        })


    );
  }
}
