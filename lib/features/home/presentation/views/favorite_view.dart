
import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/features/test/presentation/view/widget/custom_test_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/favorite/favorite_view_body.dart';
class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'Favorite',
      ),
      body: FavoriteViewBody(),
     
    );
  }
}
