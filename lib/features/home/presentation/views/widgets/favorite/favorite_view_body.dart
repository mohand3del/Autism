import 'package:autism/features/home/presentation/views/widgets/favorite/favorite_videos_bloc_builder.dart';
import 'package:flutter/material.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FavoriteVideosBlocBuilder(),
      ),
    );
  }
}
