
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/home_explore_list_view.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/explore_shimmer_loading.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'custom_skeletonizer_list_view.dart';
import 'home_explore_list_view_item.dart';

class ExploreBlocBuilder extends StatelessWidget {
  const ExploreBlocBuilder({super.key});

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
            return ExploreListView(fullDatum: data.fullData);  // Return the data view widget
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
  return const CustomSkeletonizerListView();

  }

  Widget setupError() {
    return const SizedBox.shrink();  // You can customize this if you want to show an error message
  }
}
