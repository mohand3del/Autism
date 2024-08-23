
import 'package:autism/core/utils/extentions.dart';
import 'package:flutter/material.dart';

import 'history_list_view_item.dart';

class HistoryListView extends StatefulWidget {
  const HistoryListView({super.key});

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
          return const HistoryListViewItem();
        },
      ),
    );
  }
}
