import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:autism/features/community/presentation/view/widgets/community_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../viewModel/show_post_comments/cubit/show_post_comments_cubit.dart';
import 'add_comment_field.dart';
import 'comment_tree_widget.dart';
import 'comment_shimmer.dart';

class CommentViewBody extends StatefulWidget {
  final String postId;
  final Post? post;
  final User? user;
  final Datum? data;

  const CommentViewBody(
      {super.key, required this.postId, this.post, this.user, this.data});

  @override
  State<CommentViewBody> createState() => _CommentViewBodyState();
}

class _CommentViewBodyState extends State<CommentViewBody> {
  String? replyingToId;
  String? replyingToUser;

  void startReply(String commentId, String userId) {
    setState(() {
      replyingToId = commentId;
      replyingToUser = userId;
    });
  }

  void cancelReply() {
    setState(() {
      replyingToId = null;
      replyingToUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPostCommentsCubit, ShowPostCommentsState>(
      builder: (context, state) {
        return Column(
          children: [
            CommunityPost(
                postId: widget.postId,
                data: widget.data,
                user: widget.user,
                post: widget.post),
            if (replyingToId != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Replying to @$replyingToUser',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: cancelReply,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ),
            state.maybeWhen(
              loading: () => const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CommentsShimmerList(),
                ),
              ),
              error: (message) => Center(child: Text(message)),
              success: (comments) => Expanded(
                child: CommentsTreeView(
                  comments: comments,
                  postId: widget.postId,
                  onReply: startReply,
                ),
              ),
              orElse: () => const SizedBox(),
            ),
            AddCommentField(
              hintText: replyingToId != null
                  ? 'Write a reply...'
                  : 'Write a comment...',
              onCommentSubmit: (value) {
                if (value.isNotEmpty) {
                  context.read<ShowPostCommentsCubit>().addComment(
                        widget.postId,
                        value,
                        replyingToId != null ? 'reply' : 'add',
                        replyingToId ?? '',
                      );
                  if (replyingToId != null) {
                    cancelReply();
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
