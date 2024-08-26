import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'explore_list_view_item.dart';

class ExploreListView extends StatefulWidget {
  final List<FullDatum?> fullData;

  ExploreListView({Key? key, required this.fullData}) : super(key: key);

  @override
  _ExploreListViewState createState() => _ExploreListViewState();
}

class _ExploreListViewState extends State<ExploreListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {

        BlocProvider.of<VideoCubit>(context).loadMoreVideos();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 240 / 932,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.fullData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle tap
            },
            child: ExploreListViewItem(
              fullDatum: widget.fullData[index],
            ),
          );
        },
      ),
    );
  }
}
