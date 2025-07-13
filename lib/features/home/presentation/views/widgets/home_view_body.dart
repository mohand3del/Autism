import 'package:autism/core/di/di.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_bloc_builder.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/home_explore_bloc_builder.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/explore_row.dart';
import 'package:autism/features/home/presentation/views/widgets/history/history_row.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:autism/features/home/viewModel/historyCubit/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'channel/channle_row.dart';
import 'custom_home_app_bar.dart';
import 'history/home_history_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<VideoCubit>()..getVideos()),
        BlocProvider(create: (context) => getIt<ChannelCubit>()..getChannels()),
        BlocProvider(create: (context) => getIt<HistoryCubit>()..getHistory(0)),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(context.height * 15 / 852),
              const CustomHomeAppBar(
                showWelcome: true,
                assetPath: "assets/images/fav_video_icon.svg",
              ),
              verticalSpace(context.height * 10 / 852),
              const Divider(),
              verticalSpace(context.height * 20 / 852),
              const ExploreRow(),
              verticalSpace(context.height * 20 / 852),
              // ExploreListView(fullData: [],),
              const ExploreBlocBuilder(),

              verticalSpace(context.height * 20 / 852),
              const ChannelRow(),
              verticalSpace(context.height * 20 / 852),
              //const ChannelListView(fullData: [],),
              const ChannelBlocBuilder(),
              verticalSpace(context.height * 20 / 852),
              const HistoryRow(),
              verticalSpace(context.height * 20 / 852),
              //const HistoryListView(),
              const HomeHistoryBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
