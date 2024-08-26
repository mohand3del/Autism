import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/home/presentation/views/widgets/channel/channel_bloc_builder.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/explore_bloc_builder.dart';
import 'package:autism/features/home/presentation/views/widgets/exploreList/explore_row.dart';
import 'package:autism/features/home/presentation/views/widgets/history/history_row.dart';
import 'package:autism/features/home/viewModel/channelCubit/channel_cubit.dart';
import 'package:autism/features/home/viewModel/exploreVideoCubit/video_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'channel/channle_row.dart';
import 'history/history_list_view.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<VideoCubit>()..getVideos()),
        BlocProvider(create: (context) => getIt<ChannelCubit>()..getChannels()),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(context.height * 0.013),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
                child: Row(
                  children: [
                    SizedBox(
                      height: context.height * 54 / 852,
                      width: context.width * 54 / 393,
                      child: const CircleAvatar(
                        radius: 54,
                        backgroundImage: AssetImage('assets/images/userImage.png'),
                      ),
                    ),
                    horizontalSpace(context.width * 12 / 393),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Welcome!',
                          style: AppStyles.regular16(context).copyWith(
                            fontFamily: "Poppins",
                            color: const Color(0xff989898),
                          ),
                        ),
                        Text(
                          'Mohand',
                          style: AppStyles.medium20(context).copyWith(
                            color: AppColors.black,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: const FaIcon(
                        FontAwesomeIcons.youtube,
                        color: AppColors.black,
                        size: 40,
                      ),
                    ),
                  ],
                ),


              ),
              verticalSpace(context.height * 41 / 932),
              const ExploreRow(),
              verticalSpace(context.height * 20 / 932),
              // ExploreListView(fullData: [],),
              const ExploreBlocBuilder(),
              verticalSpace(context.height * 20 / 932),
              const ChannelRow(),
              verticalSpace(context.height * 20 / 932),
              //const ChannelListView(fullData: [],),
              ChannelBlocBuilder(),
              verticalSpace(context.height * 20 / 932),
              const HistoryRow(),
              verticalSpace(context.height * 20 / 932),
              const HistoryListView(),


            ],
          ),
        ),
      ),
    );
  }
}
