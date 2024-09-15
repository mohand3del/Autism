

import 'package:autism/features/home/data/model/history_response_body.dart';
import 'package:autism/features/home/presentation/views/widgets/history/history_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key, required this.fullData});

  final FullData? fullData;

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(

      child: ListView.builder(

        itemCount: widget.fullData?.videos.length,
        itemBuilder: (BuildContext context, int index) {
          final video = widget.fullData?.videos[index];
          final channel = widget.fullData?.channels;
          return GestureDetector(
              onTap: (){

                context.push('/video', extra: widget.fullData?.videos[index].id.toString());
              },
              child: HistoryItem(video: video, channel: channel?[index % channel.length]));
        },
      ),
    );
  }
}
