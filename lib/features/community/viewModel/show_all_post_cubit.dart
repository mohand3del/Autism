import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/repo/show_all_posts_repo.dart';

part 'show_all_post_state.dart';
part 'show_all_post_cubit.freezed.dart';

class ShowAllPostCubit extends Cubit<ShowAllPostState> {
  ShowAllPostCubit(this._showAllPostsRepo) : super(const ShowAllPostState.initial());
  final ShowAllPostsRepo _showAllPostsRepo;


  Future<void> showAllPosts() async {
    emit(const ShowAllPostState.loading());
    final result = await _showAllPostsRepo.showAllPosts();
    result.when(
      success: (data) => emit(ShowAllPostState.loaded(data)),
      failure: (message) => emit(ShowAllPostState.error(message.apiErrorModel.message??"")),
    );
  }

}
