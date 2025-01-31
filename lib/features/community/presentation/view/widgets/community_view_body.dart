
import 'package:autism/features/community/presentation/view/widgets/show_all_posts_bloc_builder.dart';
import 'package:flutter/material.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
       // CommunityPostListView()
        ShowAllPostsBlocBuilder(),

      ],

    );
  }
}
