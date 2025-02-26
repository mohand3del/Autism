import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/core/utils/user_data_cache.dart';
import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
import 'package:autism/features/profile/data/model/row_profile_model.dart';
import 'package:autism/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:autism/features/profile/presentation/view/widgets/profile_section.dart';
import 'package:autism/features/profile/viewModel/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({super.key});

  final List<RowProfileModel> profileList = [
    RowProfileModel(
      leadingIcon: 'assets/images/edit_icon.svg',
      text: 'Edit Profile',
      routePath: '/editProfile',
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/contact.svg',
      text: 'Contact Information',
      routePath: '/contactInformation',
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/verify.svg',
      text: 'Verify Certificate',
      routePath: '/verifyCertificate',
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/about.svg',
      text: 'About App',
      routePath: '/about',
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/FQA.svg',
      text: 'FQAS & Help',
      routePath: '/faqs',
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/legel.svg',
      text: 'Privacy',
      routePath: '/privacy',
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/setting.svg',
      text: 'Settings',
      routePath: '/settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProfileUserDataResponse?>(
      stream: UserDataCache.instance.userDataStream,
      initialData: UserDataCache.instance.userData,
      builder: (context, snapshot) {
        final cachedUserData = snapshot.data;

        if (cachedUserData == null) {
          context.read<ProfileCubit>().getProfileData();
        }

        return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (cachedUserData != null) {
              return _buildProfileContent(context, cachedUserData);
            }

            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (userData) {
                UserDataCache.instance.updateUserData(userData);
                return _buildProfileContent(context, userData);
              },
              error: (message) => Center(child: Text('Error: $message')),
            );
          },
        );
      },
    );
  }

  Widget _buildProfileContent(
      BuildContext context, ProfileUserDataResponse userData) {
    return Column(
      children: [
        ProfileHeader(
          image: userData.user.image,
        ),
        verticalSpace(context.height * 32 / 852),
        Text(
          userData.user.name,
          style: AppStyles.medium24(context).copyWith(
            color: AppColors.black,
            fontFamily: "Poppins",
          ),
        ),
        Text(
          userData.user.email,
          style: AppStyles.regular20(context).copyWith(
            color: const Color(0xff989898),
            fontFamily: "Poppins",
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: profileList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                verticalSpace(12),
                ProfileSection(
                  leadingIcon: profileList[index].leadingIcon!,
                  text: profileList[index].text!,
                  rowProfileModel: profileList[index],
                  onTap: () => profileList[index].navigate(context),
                ),
                if (index < profileList.length - 1) ...[
                  verticalSpace(12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(),
                  ),
                ],
              ],
            );
          },
        ),
        //verticalSpace(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              GestureDetector(
                child: SvgPicture.asset('assets/images/logout.svg',
                    width: 24, height: 24),
              ),
              horizontalSpace(10),
              Text(
                'Logout',
                style: AppStyles.regular20(context).copyWith(
                    color: const Color(0xffD20707), fontFamily: "Poppins"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
