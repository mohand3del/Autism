
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/explore_shimmer_loading.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../recommended_video_skeleton.dart';
import 'explore_item_list.dart';

class ExploreListBlocBuilder extends StatelessWidget {
  const ExploreListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();  // Return the loading widget
          },
          success: (data) {
            final videoCubit = context.read<VideoCubit>();
            final updatedVideos = List.from(videoCubit.allVideos)..addAll(data.fullData);

            // Merge the new data with the existing data in the Cubi
           // videoCubit.allVideos.addAll(data.fullData);

            return ExploreItemList(fullData: videoCubit.allVideos);  // Return the data view widget with all saved data
          },
          error: (String error) {
            return setupError();  // Return the error widget
          },
          orElse: () {
            return const SizedBox.shrink();  // Return an empty widget if none of the above matches
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const RecommendedVideoSkeleton();
  }

  Widget setupError() {
    return const SizedBox.shrink();  // You can customize this if you want to show an error message
  }
}
