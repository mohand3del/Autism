



import 'package:autism/features/home/presentation/views/widgets/channel/channel_card_item.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_list_view.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_list_view_shimmer.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'channel_info_card.dart';
import 'custom_skeleton_card_info.dart';



class ChannelInfoBlocBuilder extends StatelessWidget {
  const ChannelInfoBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<ChannelCubit, ChannelState>(
      buildWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();  // Return the loading widget
          },
          success: (data) {
            return ChannelCard(data: data.fullData);  // Return the data view widget
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
    return CustomSkeletonCardInfo();
  }

  Widget setupError() {
    return const SizedBox.shrink();  // You can customize this if you want to show an error message
  }
}
