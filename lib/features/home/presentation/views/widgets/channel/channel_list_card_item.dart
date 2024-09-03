

import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_card_item.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChannelListCardItem extends StatefulWidget {
  const ChannelListCardItem({super.key, required this.fullDatum});
  final List<FullDatum> fullDatum;

  @override
  State<ChannelListCardItem> createState() => _ChannelListCardItemState();
}

class _ChannelListCardItemState extends State<ChannelListCardItem> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (!_isLoadingMore &&
          _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
          _hasMoreData) {
        setState(() {
          _isLoadingMore = true;
        });

        BlocProvider.of<ChannelCubit>(context).loadMoreChannels();
        if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {

          _scrollController.position.correctPixels(_scrollController.position.minScrollExtent);
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
          setState(() {
            _isLoadingMore = false;
            _hasMoreData = state.data.nextPageToken != null;
          });
        } else if (state is Error) {
          setState(() {
            _isLoadingMore = false;
          });
        }
      },
      child: Expanded(child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          itemCount: widget.fullDatum.length + (_hasMoreData ? 1 : 0),

          itemBuilder: (context, index) {
            if (index >= widget.fullDatum.length) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _isLoadingMore
                      ? const CircularProgressIndicator()
                      : const SizedBox.shrink(),
                ),
              );
            }
        return  ChannelCardItem(fullDatum:widget.fullDatum[index],);
      })),
    );
  }
}
