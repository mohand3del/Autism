import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../data/model/show_post_comments_response.dart' as response;
import 'package:autism/core/constant/app_colors.dart';

class CommentsTreeView extends StatefulWidget {
  final List<response.Comment> comments;
  final String postId;
  final Function(String commentId, String userId) onReply;
  
  const CommentsTreeView({
    super.key, 
    required this.comments,
    required this.postId,
    required this.onReply,
  });

  @override
  State<CommentsTreeView> createState() => _CommentsTreeViewState();
}

class _CommentsTreeViewState extends State<CommentsTreeView> {
  final Set<String> expandedComments = {};

  void toggleComment(String commentId) {
    setState(() {
      if (expandedComments.contains(commentId)) {
        expandedComments.remove(commentId);
      } else {
        expandedComments.add(commentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.comments.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No comments yet. Be the first to comment!',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.comments.length,
      itemBuilder: (context, index) {
        final comment = widget.comments[index];
        final isExpanded = expandedComments.contains(comment.id);
        final hasReplies = comment.subcommentsNumber > 0;
        
        return Column(
          children: [
            _buildCommentTile(
              context,
              comment.userData,
              comment.comment,
              comment.createdAt,
              comment.id,
              comment.subcommentsNumber,
              isReply: false,
              hasReplies: hasReplies,
              isExpanded: isExpanded,
              onToggleReplies: hasReplies ? () => toggleComment(comment.id) : null,
              onReply: () => widget.onReply(comment.id, comment.userId),
            ),
            if (isExpanded && hasReplies)
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: comment.subcomments.length,
                  itemBuilder: (context, index) {
                    final subcomment = comment.subcomments[index];
                    return _buildCommentTile(
                      context,
                      subcomment.userData,
                      subcomment.comment,
                      subcomment.createdAt,
                      comment.id,
                      0,
                      isReply: true,
                      hasReplies: false,
                      isExpanded: false,
                      onReply: () => widget.onReply(comment.id, subcomment.userId),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCommentTile(
    BuildContext context,
    response.UserData userData,
    String content,
    DateTime createdAt,
    String commentId,
    int repliesCount, {
    required bool isReply,
    required bool hasReplies,
    required bool isExpanded,
    VoidCallback? onToggleReplies,
    VoidCallback? onReply,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: isReply ? 14 : 18,
            backgroundColor: AppColors.primaryColor,
            backgroundImage: NetworkImage(userData.image),
            onBackgroundImageError: (_, __) => const Icon(Icons.person),
            child: userData.image.isEmpty ? const Icon(Icons.person, color: Colors.white) : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        timeago.format(createdAt),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: onReply,
                        child: Text(
                          'Reply',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ),
                      if (hasReplies) ...[
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: onToggleReplies,
                          child: Row(
                            children: [
                              Text(
                                '$repliesCount ${repliesCount == 1 ? 'Reply' : 'Replies'}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
