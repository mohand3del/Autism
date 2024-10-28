


import 'package:autism/features/community/presentation/view/widgets/community_post.dart';
import 'package:flutter/material.dart';

import 'add_comment_field.dart';
import 'comment_tree_widget.dart';

class CommentViewBody extends StatelessWidget {
  const CommentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CommunityPost(),
        const CommentTree(),
        const Spacer(),
        AddCommentField(onCommentSubmit: (value){},),

      ],
    );
  }
}
