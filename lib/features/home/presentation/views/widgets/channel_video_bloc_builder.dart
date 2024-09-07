import 'package:autism/features/home/presentation/views/widgets/recommended_video_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';

import 'channel_videos_list_view.dart'; // Use your cubit

class ChannelListBlocBuilder extends StatelessWidget {
  const ChannelListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelCubit, ChannelState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => setupLoading(),
          success: (data) => ChannelVideosListView(videos: data.fullData.videos,),
          error: (String error) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const RecommendedVideoSkeleton();
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
