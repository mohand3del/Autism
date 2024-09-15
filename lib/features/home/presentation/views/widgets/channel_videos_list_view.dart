
import 'package:autism/features/home/data/model/channel_by_id_response_body.dart';
import 'package:autism/features/home/presentation/views/widgets/channel_videos_item.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChannelVideosListView extends StatefulWidget {
  const ChannelVideosListView({super.key, required this.videos,  this.fullData,});

  final List<Video> videos;
  final List<FullData>? fullData;


  @override
  _ChannelVideosListViewState createState() => _ChannelVideosListViewState();
}

class _ChannelVideosListViewState extends State<ChannelVideosListView> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (!_isLoadingMore &&
          _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
          BlocProvider.of<ChannelCubit>(context).hasMoreData) {
        setState(() {
          _isLoadingMore = true;
        });

       // BlocProvider.of<VideoCubit>(context).loadMoreVideos();
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
    return BlocListener<ChannelCubit, ChannelState>(
      listener: (BuildContext context, state) {
        if (state is Success) {
          setState(() {
            _isLoadingMore = false;
          });
        } else if (state is Error) {
          setState(() {
            _isLoadingMore = false;
          });
        }
      },
      child: Expanded(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.videos.length + (BlocProvider.of<ChannelCubit>(context).hasMoreData ? 1 : 0),
          itemBuilder: (BuildContext context, int index) {
            if (index >= widget.videos.length) {
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
                onTap: () {

                  context.push("/video", extra: widget.videos[index].id.toString());
                },
                child: ChannelVideosItem(videoData: widget.videos[index]));
          },
        ),
      ),
    );
  }
}


// import 'package:go_router/go_router.dart';
//
// class ChannelVideosListView extends StatefulWidget {
//   const ChannelVideosListView({super.key, required this.videos});
//   final List<Video> videos;
//
//   @override
//   _ChannelVideosListViewState createState() => _ChannelVideosListViewState();
// }
//
// class _ChannelVideosListViewState extends State<ChannelVideosListView> {
//   late ScrollController _scrollController;
//   double? _savedScrollOffset;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.7) {
//         final cubit = BlocProvider.of<ChannelCubit>(context);
//         if (cubit.hasMoreData && !cubit.isFetchingData) {
//           cubit.loadMoreChannels();
//         }
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<ChannelCubit, ChannelState>(
//       listener: (context, state) {
//         if (state is Success) {
//           // Save current scroll position
//           _savedScrollOffset = _scrollController.offset;
//
//           // Scroll back to saved position after a delay
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (_savedScrollOffset != null) {
//               _scrollController.jumpTo(_savedScrollOffset!);
//             }
//           });
//         }
//       },
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.vertical,
//         itemCount:
//         BlocProvider.of<ChannelCubit>(context).allChannels.length + 1, // Add 1 for the loading indicator
//         itemBuilder: (context, index) {
//           final channelCubit = BlocProvider.of<ChannelCubit>(context);
//           if (index >= channelCubit.allChannels.length) {
//             return Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: channelCubit.isFetchingData
//                     ? const CircularProgressIndicator()
//                     : const SizedBox.shrink(),
//               ),
//             );
//           }
//
//           return GestureDetector(
//             onTap: () {
//               context.push('/video', extra: channelCubit.allChannels[index]);
//             },
//             child: ChannelVideosItem(
//               videoData: widget.videos[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

