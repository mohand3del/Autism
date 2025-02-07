import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:autism/features/community/presentation/view/widgets/comment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewModel/show_post_comments/cubit/show_post_comments_cubit.dart';

class CommentView extends StatelessWidget {
  final String postId;
  final Post? post;
  final User? user;
  final Datum? data;
  const CommentView({super.key, required this.postId, this.post, this.user, this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPostCommentsCubit, ShowPostCommentsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: const Text('Comments'),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert, color: AppColors.grey),
                onPressed: () {},
              ),
            ],
          ),
          body: CommentViewBody(postId: postId,
           post: post,           // Add this
            user: user,           // Add this
            data: data,
          ),
        );
      },
    );
  }
}
