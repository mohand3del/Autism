
import 'package:autism/core/di/di.dart';
import 'package:autism/features/community/presentation/view/widgets/create_post_app_bar.dart';
import 'package:autism/features/community/presentation/view/widgets/create_post_bloc_listener.dart';
import 'package:autism/features/community/presentation/view/widgets/create_post_view_body.dart';
import 'package:autism/features/community/viewModel/create_post_cubit/create_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreatePostCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: CreatePostAppBar(
              title: 'Create Post',
              onPostPressed: () {
                createPost(context);
              },
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                CreatePostViewBody(),
                const CreatePostBlocListener(),
              ],
            ),
          );
        }
      ),
    );
  }

  void createPost(BuildContext context) {
    context.read<CreatePostCubit>().createPost(
      text: context.read<CreatePostCubit>().textController.text,
      category: "Education",
      postType: "Question",
      method: 'Post',
      image: context.read<CreatePostCubit>().selectedImage,
      // Uncomment and specify file if needed
    );
  }

}
