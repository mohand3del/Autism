import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/core/utils/spacing.dart';
import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:autism/features/community/presentation/view/comment_view.dart';
import 'package:flutter/material.dart';

import 'post_action_button.dart';
import 'reactionIconWidget.dart';

class CommunityPost extends StatefulWidget {
  const CommunityPost({super.key, this.user, this.post,  this.data, });

  final User? user;
  final Post? post;
  final Datum? data;


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
      isLiked = !isLiked; // Toggle the like state
    });
  }

  void _selectReaction() {
    setState(() {
      isLiked = true; // Set the like state to true when a reaction is selected
      showReactions = false; // Hide the reactions row after selecting a reaction
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideReactions, // Tap anywhere to hide reactions
      child: Column(
        children: [
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
                // Profile Info (Image, Name, Time, Icon)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                       CircleAvatar(
                       radius: 25,
                       child: ClipRRect(child: Image.network(widget.data?.user.image ??"https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=1024x1024&w=is&k=20&c=oGqYHhfkz_ifeE6-dID6aM7bLz38C6vQTy1YcbgZfx8=")), // Profile image size
                      ),
                      const SizedBox(width: 10),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                              widget.data?.user.name ?? 'Dr. Jan',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              //const SizedBox(width: 4),
                              horizontalSpace(context.width * 4 / 393),
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 16,
                              ),
                            ],
                          ),
                          const Text(
                            '15h',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      // Close icon
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert,
                          color: AppColors.grey,
                          size: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.close,
                          color: AppColors.grey,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(context.height * 10 / 851),

                // Post content text
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                   widget.data?.post.text  ??"Hi, I'm Dr. Jan in the autism department. I can help anyone with anything and I'm waiting for your comments. Merci.",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                verticalSpace(context.height * 10 / 851),

                // Show reactions row when like is long-pressed
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
                              offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ReactionIcon(
                              image: const AssetImage('assets/images/Like.png'),
                              onTap: _selectReaction, // Handle like action
                            ),
                            ReactionIcon(
                              image: const AssetImage('assets/images/love.png'),
                              onTap: _selectReaction, // Handle love action
                            ),
                            ReactionIcon(
                              image: const AssetImage('assets/images/colburite.png'),
                              onTap: _selectReaction, // Handle special reaction
                            ),
                            ReactionIcon(
                              image: const AssetImage('assets/images/led.png'),
                              onTap: _selectReaction, // Handle idea action
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:  Row(
                    children: [
                      SizedBox(
                        width: context.width * 40 / 393,
                        child: Stack(
                          children: [
                        widget.data?.post.likesNumber == 0 ? const SizedBox():   Image.asset('assets/images/like2.png'),
                            Positioned(
                              left: context.width * 12 / 393,
                              child:widget.data?.post.lovesNumber == 0 ? const SizedBox(): Image.asset('assets/images/love2.png'),
                            ),
                          ],
                        ),
                      ),
                      widget.data?.post.likesNumber == 0 ? const SizedBox():   Text(
                      widget.data?.post.reactionsNumber.toString() ?? '1.2k',
                        style: AppStyles.regular13(context).copyWith(
                          fontFamily: 'Inter',
                          color: AppColors.lightGrey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                       '${widget.data?.post.commentsCount.toString()} comments ' ?? '3 comments ',
                        style: AppStyles.regular13(context).copyWith(
                          fontFamily: 'Inter',
                          color: AppColors.lightGrey,
                        ),
                      ),
                      Text(
                        '. ${widget.data?.post.repostsNumber} repost' ??'. 2 repost',
                        style: AppStyles.regular13(context).copyWith(
                          fontFamily: 'Inter',
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),

                // Bottom Buttons (Like, Comment, Repost, Share)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onLongPress: _onLongPressLike,
                      child: PostActionButton(
                        icon: isLiked
                            ? const AssetImage('assets/images/Like.png')
                            : const AssetImage('assets/images/outlined_like.png'),
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
                          MaterialPageRoute(builder: (context) => const CommentView()),
                        );
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
                      onTap: () {
                        // Handle Share
                      },
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
