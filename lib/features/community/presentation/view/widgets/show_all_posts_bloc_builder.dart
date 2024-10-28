




import 'package:autism/features/community/data/model/show_post_response.dart';
import 'package:autism/features/community/presentation/view/widgets/community_post_list_view.dart';
import 'package:autism/features/community/presentation/view/widgets/community_post_shimmer_loading.dart';
import 'package:autism/features/community/viewModel/show_all_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllPostsBlocBuilder extends StatelessWidget {
  const ShowAllPostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ShowAllPostCubit, ShowAllPostState>(
        buildWhen: (previous, current) => current is Loading || current is Loaded || current is Error,
        builder: (BuildContext context, state)


    {

      return state.maybeWhen(orElse: () {
        return const SizedBox.shrink();
      }, loading: () {
        return const CommunityPostShimmerLoading();
      }, loaded: (showPostResponse) {

        return CommunityPostListView(data:showPostResponse.data,);
      }, error: (String error) {
        return const SizedBox();
      });
    });
  }
}
