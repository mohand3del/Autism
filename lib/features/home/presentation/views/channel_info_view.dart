

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/presentation/views/widgets/channel_info_view_body.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChannelInfoView extends StatefulWidget {
  const ChannelInfoView({super.key, this.channelId, this.fullData});
  final String? channelId;
  final FullDatum? fullData;


  @override
  State<ChannelInfoView> createState() => _ChannelInfoViewState();
}

class _ChannelInfoViewState extends State<ChannelInfoView> {
  late Future<void> _channelFuture;

  @override
  void initState() {
    super.initState();
    _channelFuture = context.read<ChannelCubit>().getChannelById(channelId: widget.channelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: FutureBuilder<void>(
        future: _channelFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return BlocBuilder<ChannelCubit, ChannelState>(
              builder: (context, state) {
                if (state is Success) {
                  return ChannelInfoViewBody(channelId:widget.fullData?.id ,);
                } else if (state is Error) {
                  return Center(child: Text(state.error));
                } else {
                  return const Center(child: Text('Unexpected state'));
                }
              },
            );
          }

        },
      ),
    );
  }
}
