import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/di/di.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/community/data/model/add_reaction_request_body.dart';
import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:autism/features/community/presentation/view/comment_view.dart';
import 'package:autism/features/community/viewModel/add_reaction_cubit/add_reaction_cubit.dart';
import 'package:autism/features/community/viewModel/delete_reaction_cubit/delete_reaction_cubit.dart';
import 'package:autism/features/community/viewModel/show_post_comments/cubit/show_post_comments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import 'post_action_button.dart';
import 'reactionIconWidget.dart';

class CommunityPost extends StatefulWidget {
  const CommunityPost(
      {super.key,
      this.user,
      this.post,
      this.data,
      this.postId,
      this.showDivider = true});

  final User? user;
  final Post? post;
  final Datum? data;
  final String? postId;
  final bool showDivider; // Add this line

  @override
  _CommunityPostState createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  bool showReactions = false; // To control the visibility of reactions
  bool isLiked = false; // To control the like/unlike state

  void _onLongPressLike() {
    setState(() {
      showReactions = true;
    });
  }

  void _hideReactions() {
    setState(() {
      showReactions = false;
    });
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      final addReactionRequestBody = AddReactionRequestBody(reaction: 'like');
      if (isLiked) {
        // Add reaction when liked
        context
            .read<AddReactionCubit>()
            .addReaction(addReactionRequestBody, widget.postId ?? '');
      } else {
        // Remove reaction when unliked
        context.read<DeleteReactionCubit>().deleteReaction(widget.postId ?? '');
      }
    });
  }

  void _selectReaction(String reaction) {
    final addReactionRequestBody = AddReactionRequestBody(reaction: reaction);
    context
        .read<AddReactionCubit>()
        .addReaction(addReactionRequestBody, widget.postId ?? '');

    setState(() {
      isLiked = true;
      showReactions = false; // Hide reactions after selection
    });
  }

  void _sharePost() async {
    try {
      final String postContent = widget.data?.post.text ?? "";
      final String userName = widget.data?.user.name ?? "User";
      
      String shareText = "Post from $userName: \n\n$postContent";
      
      // Add hashtag
      shareText += "\n\n#AutismCommunity";
      
      // Check if there are images to share
      if (widget.data?.post.images != null && widget.data!.post.images.isNotEmpty) {
        shareText += "\n\nImages available in original post.";
      }
      
      // Share the post content with await to catch any potential errors
      await Share.share(shareText);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not share post: $e"))
      );
    }
  }

  // Function to format timestamp like Facebook
  String _formatTimeAgo(String? timestamp) {
    if (timestamp == null) return '2 hours ago';

    try {
      final DateTime postTime = DateTime.parse(timestamp);
      final DateTime now = DateTime.now();
      final difference = now.difference(postTime);

      if (difference.inSeconds < 60) {
        return 'Just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
      } else if (difference.inDays < 30) {
        return '${(difference.inDays / 7).floor()} ${(difference.inDays / 7).floor() == 1 ? 'week' : 'weeks'} ago';
      } else if (difference.inDays < 365) {
        return DateFormat('MMMM d').format(postTime);
      } else {
        return DateFormat('MMMM d, y').format(postTime);
      }
    } catch (e) {
      return '2 hours ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideReactions,
      child: Column(
        children: [
          if (widget.showDivider)
            const Divider(
              thickness: 4,
              color: AppColors.dotGray,
            ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Info
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          widget.data?.user.image ??
                              "https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.data?.user.name.toString() ?? 'Dr. Jan',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              horizontalSpace(context.width * 4 / 393),
                              const Icon(
                                Icons.verified,
                                color: AppColors.primaryColor,
                                size: 16,
                              ),
                            ],
                          ),
                          Text(
                            _formatTimeAgo(
                                widget.data?.post.createdAt.toString()),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert,
                          color: AppColors.grey,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(context.height * 10 / 851),

                // Post content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.data?.post.text ??
                        "Hi, I'm Dr. Jan in the autism department. I can help anyone with anything and I'm waiting for your comments.",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                // Display images under post text if images are not null or empty
                if (widget.data?.post.images != null &&
                    widget.data!.post.images.isNotEmpty)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 3 images per row
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        childAspectRatio: 1,
                      ),
                      itemCount: widget.data!.post.images
                          .where((img) => img.toString().startsWith('http'))
                          .length,
                      itemBuilder: (context, index) {
                        final validImages = widget.data!.post.images
                            .where((img) => img.toString().startsWith('http'))
                            .toList();
                        final imageUrl = validImages[index].toString();
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox.shrink(),
                          ),
                        );
                      },
                    ),
                  ),
                verticalSpace(context.height * 10 / 851),

                // Reaction row
                if (showReactions)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 185,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ReactionIcon(
                              image: const AssetImage('assets/images/Like.png'),
                              onTap: () => _selectReaction("like"),
                            ),
                            ReactionIcon(
                              image: const AssetImage('assets/images/love.png'),
                              onTap: () => _selectReaction("love"),
                            ),
                            ReactionIcon(
                              image: const AssetImage(
                                  'assets/images/colburite.png'),
                              onTap: () => _selectReaction("special"),
                            ),
                            ReactionIcon(
                              image: const AssetImage('assets/images/led.png'),
                              onTap: () => _selectReaction("idea"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Bottom Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onLongPress: _onLongPressLike,
                      child: PostActionButton(
                        icon: isLiked
                            ? const AssetImage('assets/images/Like.png')
                            : const AssetImage(
                                'assets/images/outlined_like.png'),
                        text: 'Like',
                        onTap: _toggleLike,
                      ),
                    ),
                    PostActionButton(
                      icon: const AssetImage('assets/images/commentIcone.png'),
                      text: 'Comment',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) =>
                                    getIt<ShowPostCommentsCubit>()
                                      ..getPostComments(widget.postId ?? ''),
                                child: CommentView(
                                  postId: widget.postId ?? '',
                                  post: widget.post, // Add this
                                  user: widget.user, // Add this
                                  data: widget.data,
                                ),
                              ),
                            ));
                      },
                    ),
                    PostActionButton(
                      icon: const AssetImage('assets/images/repostIcone.png'),
                      text: 'Repost',
                      onTap: () {
                        // Handle Repost
                      },
                    ),
                    PostActionButton(
                      icon: const AssetImage('assets/images/shareIcone.png'),
                      text: 'Share',
                      onTap: _sharePost,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
