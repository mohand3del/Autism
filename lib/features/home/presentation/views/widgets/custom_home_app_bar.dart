import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/utils/user_data_cache.dart';
import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
import 'package:autism/features/profile/viewModel/profileCubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomHomeAppBar extends StatelessWidget {
  final bool showWelcome;
  final VoidCallback? onIconPressed;
 final String? assetPath ;
  const CustomHomeAppBar({
    super.key,
    this.showWelcome = false,
    this.onIconPressed, this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return StreamBuilder<ProfileUserDataResponse?>(
          stream: UserDataCache.instance.userDataStream,
          initialData: UserDataCache.instance.userData,
          builder: (context, snapshot) {
            final userData = snapshot.data;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
              child: Skeletonizer(
                enabled: state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => GoRouter.of(context).push('/profile'),
                      child: SizedBox(
                        height: context.height * 50 / 852,
                        width: context.width * 50 / 393,
                        child: CircleAvatar(
                          radius: 54,
                          backgroundImage: userData?.user.image.isNotEmpty ==
                                  true
                              ? NetworkImage(userData!.user.image)
                              : const AssetImage('assets/images/userImage.png'),
                        ),
                      ),
                    ),
                    horizontalSpace(context.width * 12 / 393),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showWelcome)
                          Text(
                            'Hello, Welcome!',
                            style: AppStyles.regular16(context).copyWith(
                              fontFamily: "Poppins",
                              color: const Color(0xff989898),
                            ),
                          ),
                        Text(
                          userData?.user.name.isNotEmpty == true
                              ? userData!.user.name
                              : 'Guest',
                          style: AppStyles.medium20(context).copyWith(
                            color: AppColors.black,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    HomeAppBarIconButton(
                      assetPath: assetPath ?? "assets/images/fav_video_icon.svg" ,
                      onPressed: onIconPressed ??
                          () => GoRouter.of(context).push('/favorite'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class HomeAppBarIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;

  const HomeAppBarIconButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Center(
        child: SvgPicture.asset(assetPath),
      ),
      color: AppColors.black,
      onPressed: onPressed,
    );
  }
}
