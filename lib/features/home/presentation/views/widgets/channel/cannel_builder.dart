


import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_list_card_item.dart';


import 'package:autism/features/home/presentation/views/widgets/exploreList/home_explore_list_view.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/explore_shimmer_loading.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'channel_card_shimmer.dart';
import 'channel_skeleton_card.dart';
import 'custom_skeletoni_channel_list.dart';

class ChannelBuilder extends StatelessWidget {
  const ChannelBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelCubit, ChannelState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();  // Return the loading widget
          },
          success: (data) {
            return ChannelListCardItem(fullDatum: data.fullData);  // Return the data view widget
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

    return  const ChannelSkeletonCard(scrollDirection: Axis.vertical,);
  }

  Widget setupError() {
    return const SizedBox.shrink();  // You can customize this if you want to show an error message
  }
}
