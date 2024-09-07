

import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:autism/features/home/presentation/views/widgets/recommended_video_item.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RecommendedListView extends StatefulWidget {
  const RecommendedListView({super.key, required this.fullData});
  final List<FullDatum?> fullData;

  @override
  State<RecommendedListView> createState() => _RecommendedListViewState();
}

class _RecommendedListViewState extends State<RecommendedListView> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (!_isLoadingMore &&
          _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
          _hasMoreData) {
        setState(() {
          _isLoadingMore = true;
        });

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
    return BlocListener<VideoCubit, VideoState>(
      listener: (BuildContext context, state) {
        if (state is Success) {
          setState(() {
            _isLoadingMore = false;
            _hasMoreData = state.data.nextPageToken != null;
          });
        } else if (state is Error) {
          setState(() {
            _isLoadingMore = false;
          });
        }
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: widget.fullData.length + (_hasMoreData ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index >= widget.fullData.length) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _isLoadingMore
                    ? const CircularProgressIndicator()
                    : const SizedBox.shrink(),
              ),
            );
          }
          return GestureDetector(
              onTap: (){
                context.push('/video',extra: widget.fullData[index]);
              },
              child: RecommendedVideoItem(videoData: widget.fullData[index]));
        },
      ),
    );
  }
}