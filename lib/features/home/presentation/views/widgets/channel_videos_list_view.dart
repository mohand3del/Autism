

import 'package:autism/features/home/presentation/views/widgets/channel_videos_item.dart';
import 'package:flutter/material.dart';

class ChannelVideosListView extends StatelessWidget {
  const ChannelVideosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child:

    ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {

      return ChannelVideosItem();
    })

    );
  }
}
