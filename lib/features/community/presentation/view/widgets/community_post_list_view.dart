import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:autism/features/community/viewModel/show_all_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'community_post.dart';

class CommunityPostListView extends StatelessWidget {
  const CommunityPostListView({super.key, this.data});
  final List<Datum>? data;

  Future<void> _refreshPosts(BuildContext context) async {
    // Trigger the cubit to refresh posts
    await context.read<ShowAllPostCubit>().showAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: AppColors.primaryColor,
        onRefresh: () => _refreshPosts(context), // Pull-to-refresh action
        child: ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context, index) {
            return CommunityPost(
              postId: data?[index].post.id,
              data: data?[index],
              showDivider: true,
            );
          },
        ),
      ),
    );
  }
}
