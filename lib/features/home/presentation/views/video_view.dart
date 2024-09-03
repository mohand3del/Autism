import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_by_id_cubit.dart';
import 'package:autism/features/home/data/model/video_by_id_response_body.dart';
import 'package:autism/features/home/presentation/views/widgets/video_view_body.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.fullData});
  final FullDatum fullData;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late Future<void> _videoFuture;

  @override
  void initState() {
    super.initState();
    _videoFuture = context.read<VideoByIdCubit>().getVideoById(videoId: widget.fullData.vedio.id.videoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: FutureBuilder<void>(
        future: _videoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return BlocBuilder<VideoByIdCubit, VideoByIdState>(
              builder: (context, state) {
                if (state is Success) {
                  return VideoViewBody(fullData: widget.fullData, videoData: state.data.fullData);
                } else if (state is Error) {
                  return Center(child: Text(state.error));
                } else {
                  return Center(child: Text('Unexpected state'));
                }
              },
            );
          }
        },
      ),
    );
  }
}