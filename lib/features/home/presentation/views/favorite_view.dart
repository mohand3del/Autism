import 'package:autism/core/constant/app_colors.dart';
import 'package:autism/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autism/features/home/viewModel/favorateCubit/cubit/favorite_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/favorite/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'Favorite Videos',
        onBackPressed: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: AppColors.black),
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text("Delete All Favorites"),
                    content: const Text(
                        "Are you sure you want to delete all favorite videos?"),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text("Delete"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.read<FavoriteCubit>().deleteAllFavorites();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: const FavoriteViewBody(),
    );
  }
}
