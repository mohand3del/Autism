import 'package:autism/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/show_post_comments_response.dart';
import '../../viewModel/show_post_comments/cubit/show_post_comments_cubit.dart';
import 'widgets/comment_item.dart';

class CommentsView extends StatelessWidget {
  final String postId;
  
  const CommentsView({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocBuilder<ShowPostCommentsCubit, ShowPostCommentsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            success: (comments) => _buildCommentsList(comments),
            orElse: () => const SizedBox(),
          );
        },
      ),
      bottomSheet: _buildCommentInput(context),
    );
  }

  Widget _buildCommentsList(List<Comment> comments) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: comments.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) => CommentItem(comment: comments[index]),
    );
  }

  Widget _buildCommentInput(BuildContext context) {
    final TextEditingController commentController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              decoration: const InputDecoration(
                hintText: 'Write a comment...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            color: AppColors.primaryColor,
            onPressed: () {
              if (commentController.text.isNotEmpty) {
                context.read<ShowPostCommentsCubit>().addComment(
                  postId,
                  commentController.text,
                  'comment',
                  '', // Empty string for top-level comments
                );
                commentController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
