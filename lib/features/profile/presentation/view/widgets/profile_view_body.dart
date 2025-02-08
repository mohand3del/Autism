import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/community/presentation/view/widgets/community_post.dart';
import 'package:autism/features/profile/data/model/profile_user_data_response.dart';
import 'package:autism/features/profile/data/model/row_profile_model.dart';
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
      onTap: () {},
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/contact.svg',
      text: 'Contact Information',
      onTap: () {},
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/verify.svg',
      text: 'Verify Certificate',
      onTap: () {},
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/about.svg',
      text: 'About App',
      onTap: () {},
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/FQA.svg',
      text: 'FQAS & Help',
      onTap: () {},
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/legel.svg',
      text: 'Privacy',
      onTap: () {},
    ),
    RowProfileModel(
      leadingIcon: 'assets/images/setting.svg',
      text: 'Settings',
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (userData) => _buildProfileContent(context, userData),
          error: (message) => Center(child: Text('Error: $message')),
        );
      },
    );
  }

  Widget _buildProfileContent(BuildContext context, ProfileUserDataResponse userData) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: context.height * 220 / 852,
                  child: SvgPicture.asset(
                    'assets/images/profile_shape.svg',
                    width: double.infinity,
                    height: context.height * 220 / 852,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: context.height * -20 / 852,
                  child: SizedBox(
                    height: context.height * 100 / 852,
                    width: context.width * 100 / 393,
                    child: CircleAvatar(
                      radius: 54,
                      backgroundImage:
                          NetworkImage(userData.user.image),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 40,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                ),
              ]),
          verticalSpace(context.height * 36 / 852),
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
                  ProfileSection(
                    leadingIcon: profileList[index].leadingIcon!,
                    text: profileList[index].text!,
                    onTap: profileList[index].onTap!,
                    rowProfileModel: profileList[index],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Divider(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
