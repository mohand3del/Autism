import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'home_explore_list_view_item.dart';

class ExploreListView extends StatefulWidget {
  const ExploreListView({super.key, required fullDatum});

  @override
  _ExploreListViewState createState() => _ExploreListViewState();
}

class _ExploreListViewState extends State<ExploreListView> {
  late ScrollController _scrollController;
  double? _savedScrollOffset;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.7) {
        final cubit = BlocProvider.of<VideoCubit>(context);
        if (cubit.hasMoreData && !cubit.isFetchingData) {
          cubit.loadMoreVideos();
        }
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
      listener: (context, state) {
        if (state is Success) {
          // Save current scroll position
          _savedScrollOffset = _scrollController.offset;

          // Scroll back to saved position after a delay
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_savedScrollOffset != null) {
              _scrollController.jumpTo(_savedScrollOffset!);
            }
          });
        }
      },
      child: SizedBox(
        height: context.height * 240 / 932,
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount:
                 BlocProvider.of<VideoCubit>(context).allVideos.length + 1, // Add 1 for the loading indicator
              itemBuilder: (context, index) {
                final videoCubit = BlocProvider.of<VideoCubit>(context);
                if (index >= videoCubit.allVideos.length) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: videoCubit.isFetchingData
                          ? const CircularProgressIndicator()
                          : const SizedBox.shrink(),
                    ),
                  );
                }

                return GestureDetector(
                  onTap: () {

                    context.push('/video', extra: videoCubit.allVideos[index].vedio.id.videoId.toString());
                  },
                  child: ExploreListViewItem(
                    fullDatum: videoCubit.allVideos[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

