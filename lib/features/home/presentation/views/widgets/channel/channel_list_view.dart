import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_list_view_item.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:go_router/go_router.dart';

class ChannelListView extends StatefulWidget {
  const ChannelListView({Key? key, required fullData}) : super(key: key);

  @override
  _ChannelListViewState createState() => _ChannelListViewState();
}

class _ChannelListViewState extends State<ChannelListView> {
  late ScrollController _scrollController;
  double? _savedScrollOffset;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.7) {
        final cubit = BlocProvider.of<ChannelCubit>(context);
        if (cubit.hasMoreData && !cubit.isFetchingData) {
          cubit.loadMoreChannels();
        }
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
      listener: (context, state) {
        if (state is Success) {
          // Save current scroll position
          _savedScrollOffset = _scrollController.offset;

          // Scroll back to saved position after a delay
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_savedScrollOffset != null) {
              _scrollController.jumpTo(_savedScrollOffset!);
            }
          });
        }
      },
      child: SizedBox(
        height: context.height * 100 / 932,
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount:
                  BlocProvider.of<ChannelCubit>(context).allChannels.length +
                      1, // Add 1 for the loading indicator
              itemBuilder: (context, index) {
                final channelCubit = BlocProvider.of<ChannelCubit>(context);
                if (index >= channelCubit.allChannels.length) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: channelCubit.isFetchingData
                          ? const CircularProgressIndicator()
                          : const SizedBox.shrink(),
                    ),
                  );
                }

                return GestureDetector(
                  onTap: () {
                    log("=============================" +
                        channelCubit.allChannels[index].id.toString());
                    context.push("/channelInfo",
                        extra: channelCubit.allChannels[index].id);
                  },
                  child: ChannelListViewItem(
                    itemIndex: index,
                    selectedIndex: index, // Adjust this according to your logic
                    channels: channelCubit.allChannels[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
