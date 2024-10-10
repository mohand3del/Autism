import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/utils/app_styles.dart';
import 'package:autism/core/utils/extentions.dart';
import 'package:autism/features/community/presentation/view/comment_view.dart';
import 'package:flutter/material.dart';

import 'post_action_button.dart';
import 'reactionIconWidget.dart';

class CommunityPost extends StatefulWidget {
  const CommunityPost({super.key});

  @override
  _CommunityPostState createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  bool showReactions = false; // To control the visibility of reactions

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://example.com/doctor_profile.jpg', // Replace with actual image URL
                        ),
                        radius: 25, // Profile image size
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Dr. jan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 16,
                              ),
                            ],
                          ),
                          Text(
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
                const SizedBox(height: 10),

                // Post content text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "hi I'm doctor jan in department autism can help anyone in any think and waiting for comment. Merci.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),

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
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ReactionIcon(
                              image: const AssetImage('assets/images/Like.png'),
                              onTap: () {
                                // Handle like action
                              },
                            ),
                            ReactionIcon(
                              image: const AssetImage('assets/images/love.png'),
                              onTap: () {
                                // Handle love action
                              },
                            ),
                            ReactionIcon(
                              image: const AssetImage(
                                  'assets/images/colburite.png'),
                              onTap: () {
                                // Handle special reaction
                              },
                            ),
                            ReactionIcon(
                              image: const AssetImage('assets/images/led.png'),
                              onTap: () {
                                // Handle idea action
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: context.width * 40 / 393,
                        child: Stack(
                          children: [
                            Image.asset('assets/images/like2.png'),
                            Positioned(
                              left: context.width * 12 / 393,
                              child: Image.asset('assets/images/love2.png'),
                            ),
                          ],
                        ),
                      ),
                      Text('1.2k',
                          style: AppStyles.regular13(context)
                              .copyWith(
                              fontFamily: 'Inter',
                              color: AppColors.lightGrey)),
                      const Spacer(),
                       Text(
                        '3 comments ',
                        style:
                           AppStyles.regular13(context).copyWith(
                             fontFamily: 'Inter',
                               color: AppColors.lightGrey),
                      ),
                       Text(
                        '. 2 repost',
                        style:
                        AppStyles.regular13(context).copyWith(
                            fontFamily: 'Inter',
                            color: AppColors.lightGrey),
                      )
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
                      // Show reactions on long press
                      child: PostActionButton(
                        icon:
                            const AssetImage('assets/images/outlined_like.png'),
                        text: 'Like',
                        onTap: () {
                          // Handle Like
                        },
                      ),
                    ),
                    PostActionButton(
                      icon: const AssetImage('assets/images/commentIcone.png'),
                      text: 'Comment',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CommentView()));
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
          )
        ],
      ),
    );
  }
}
