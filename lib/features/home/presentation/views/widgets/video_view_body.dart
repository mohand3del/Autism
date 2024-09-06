import 'dart:developer';

import 'package:autism/core/helper/contants.dart';
import 'package:autism/core/routing/router.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/data/model/video_by_id_response_body.dart';
import 'package:autism/features/home/data/model/video_response_body.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'description_widget.dart';
import 'video_bloc_builder.dart';

class VideoViewBody extends StatefulWidget {
  final FullDatum fullData;
  final FullData? videoData;

  const VideoViewBody(
      {Key? key, required this.fullData, required this.videoData})
      : super(key: key);

  @override
  State<VideoViewBody> createState() => _VideoViewBodyState();
}

class _VideoViewBodyState extends State<VideoViewBody> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.fullData.vedio.id.videoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    log('videoData before API call: ${widget.videoData}');

    log(widget.videoData?.vedio.id.toString() ?? 'No video id');
    log('videoData after API call: ${widget.videoData}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: context.height * 300 / 852,
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: false,
                ),
                builder: (context, player) {
                  return player;
                },
              ),
            ),
            verticalSpace(context.height * 7 / 852),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 22 / 393,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.videoData?.vedio.title ?? 'No Title',
                      style: AppStyles.medium15(context).copyWith(
                        fontFamily: "Poppins",
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  horizontalSpace(context.width * 11 / 393),
                  const Icon(Icons.favorite_border_outlined,
                      size: 28, color: Colors.grey),
                ],
              ),
            ),
            verticalSpace(context.height * 4 / 852),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 22 / 393,
              ),
              child: Row(
                children: [
                  Text('${widget.videoData?.vedio.viewCount} Views'?? 'No Views',
                  style: AppStyles.regular12(context).copyWith(
                    fontFamily: "Poppins",
                    color: Colors.grey,
                  ),
                  ),
                  horizontalSpace(context.width * 12 / 393),
                  Text(Helper.limitWords(widget.videoData?.vedio.publishedAt.toString()?? 'No Date', 1) ,
                    style: AppStyles.regular12(context).copyWith(
                      fontFamily: "Poppins",
                      color: Colors.grey,),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 22 / 393,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push('/channelInfo',extra: widget.videoData?.channel.id as String);
                    },
                    child: CircleAvatar(
                      radius: 22,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              widget.videoData?.channel.thumbnails.high.url ?? '',
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(10.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Helper.limitWords(
                              widget.videoData?.channel.title ?? 'No Description',
                              3),
                          style: AppStyles.medium13(context).copyWith(
                            fontFamily: "Poppins",
                          ),
                        ),
        
                        Container(
                          height: 30,
                          width: 83,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27.0),
                            color: const Color(0xff81AEF1),
        
                          ),
                          child: Center(
                           child:  Text(
                              Helper.formatNumber(widget.videoData?.channel.subscriberCount.toString()  ) ?? 'No Subscribers',
                             style: AppStyles.regular16(context).copyWith(
                               fontFamily: "Poppins",
                               color: Colors.white,
                             ),
                            )
                          ),
                        ),
        
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(context.height * 12 / 852),
            DescriptionWidget(  description: widget.videoData?.vedio.description??'No Description',),
            verticalSpace(context.height * 12 / 852),
            VideoBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
