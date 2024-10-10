

import 'package:autism/features/community/presentation/view/widgets/create_post_app_bar.dart';
import 'package:autism/features/community/presentation/view/widgets/create_post_view_body.dart';
import 'package:flutter/material.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CreatePostAppBar(
        title: 'Create Post',
      ),
      backgroundColor: Colors.white,
      body: CreatePostViewBody(),
    );
  }
}
