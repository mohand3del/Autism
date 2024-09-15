
import 'package:autism/features/home/presentation/views/widgets/history/history_list.dart';

import 'package:autism/features/home/viewModel/historyCubit/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../recommended_video_skeleton.dart';


class HistoryBlocBuilder extends StatelessWidget {
  const HistoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (previous, current) =>
      current is HistoryLoading || current is HistorySuccess || current is HistoryFailure,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (data) {

            return HistoryList(fullData: data.fullData);
          },
          failure: (String error) {
            return setupError();  // Return the error widget
          },
          orElse: () {
            return const SizedBox.shrink();
          },
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
