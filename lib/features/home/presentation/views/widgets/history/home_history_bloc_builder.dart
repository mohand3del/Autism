
import 'package:autism/features/home/presentation/views/widgets/exploreList/home_explore_list_view.dart';
import 'package:autism/features/home/presentation/views/widgets/history/history_list_view.dart';
import 'package:autism/features/home/viewModel/historyCubit/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../exploreList/custom_skeletonizer_list_view.dart';


class HomeHistoryBlocBuilder extends StatelessWidget {
  const HomeHistoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (previous, current) =>
      current is HistoryLoading || current is HistorySuccess || current is HistoryFailure,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();  // Return the loading widget
          },
          success: (data) {
            return HistoryListView(videoData: data.fullData.videos);  // Return the data view widget
          },
          failure: (String error) {
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
