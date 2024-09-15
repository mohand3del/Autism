
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/home/data/model/history_response_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'history_list_view_item.dart';

class HistoryListView extends StatefulWidget {
  const HistoryListView({super.key, required this.videoData});
  final List<Video?> videoData;

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 200 / 932,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  GestureDetector(
              onTap: () {
         GoRouter.of(context).go('/video',extra: widget.videoData[index]?.id.toString());
              },
              child: HistoryListViewItem(historyData: widget.videoData[index],));
        },
      ),
    );
  }
}
