

import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/community/presentation/view/widgets/comment_view_body.dart';
import 'package:flutter/material.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
            icon:  const Icon(Icons.more_vert,color: AppColors.grey,),
            onPressed: () {},
          ),

        ],

      ),
      body:const CommentViewBody(),
    );
  }
}
