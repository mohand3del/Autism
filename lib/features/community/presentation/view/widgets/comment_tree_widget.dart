import 'package:flutter/material.dart';
import 'package:comment_tree/comment_tree.dart';

class CommentTree extends StatelessWidget {
  const CommentTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CommentTreeWidget<Comment, Comment>(
        Comment(
          avatar: 'https://example.com/user1.jpg',
          userName: 'User One',
          content: 'This is a main comment. Great post!',
          timeAgo: '2h ago',
          likes: 5,
        ),
        [
          Comment(
            avatar: 'https://example.com/user2.jpg',
            userName: 'User Two',
            content: 'Thank you! I agree with your point.',
            timeAgo: '1h ago',
            likes: 2,
          ),
          Comment(
            avatar: 'https://example.com/user3.jpg',
            userName: 'User Three',
            content: 'Another reply to the main comment.',
            timeAgo: '45m ago',
            likes: 1,
          ),
        ],
        treeThemeData: const TreeThemeData(lineColor: Colors.grey, lineWidth: 1),
        avatarRoot: (context, data) => PreferredSize(
          preferredSize: const Size.fromRadius(18),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(data.avatar),
          ),
        ),
        avatarChild: (context, data) => PreferredSize(
          preferredSize: const Size.fromRadius(12),
          child: CircleAvatar(
            radius: 12,
            backgroundImage: NetworkImage(data.avatar),
          ),
        ),
        contentRoot: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCommentContent(
                userName: data.userName,
                commentText: data.content,
              ),
              buildCommentActions(
                timeAgo: data.timeAgo,
                likes: data.likes.toString(),
              ),
            ],
          );
        },
        contentChild: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCommentContent(
                userName: data.userName,
                commentText: data.content,
              ),
              buildCommentActions(
                timeAgo: data.timeAgo,
                likes: data.likes.toString(),
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget for comment content (only the text part)
  Widget buildCommentContent({
    required String userName,
    required String commentText,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(commentText),
        ],
      ),
    );
  }

  // Widget for the comment actions (like and reply below the comment)
  Widget buildCommentActions({
    required String timeAgo,
    required String likes,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
      child: Row(
        children: [
          Text(
            timeAgo,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(width: 10),
          Text(
            '$likes Likes',
            style: const TextStyle(color: Colors.blue, fontSize: 12),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              // Handle reply action
            },
            child: const Text(
              'Reply',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String avatar;
  final String userName;
  final String content;
  final String timeAgo;
  final int likes;

  Comment({
    required this.avatar,
    required this.userName,
    required this.content,
    required this.timeAgo,
    required this.likes,
  });
}
