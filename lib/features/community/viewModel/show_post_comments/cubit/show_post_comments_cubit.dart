import 'package:autism/core/network/api_result.dart';
import 'package:autism/features/community/data/model/show_post_comments_response.dart';
import 'package:autism/features/community/data/repo/show_post_comments_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'show_post_comments_state.dart';
part 'show_post_comments_cubit.freezed.dart';

class ShowPostCommentsCubit extends Cubit<ShowPostCommentsState> {
  final ShowPostCommentsRepo _commentsRepo;
  
  ShowPostCommentsCubit(this._commentsRepo) : super(const ShowPostCommentsState.initial());

  Future<void> getPostComments(String postId) async {
    try {
      emit(const ShowPostCommentsState.loading());
      final result = await _commentsRepo.showPostComments(postId, 0, 0);
      result.when(
        success: (response) {
          emit(ShowPostCommentsState.success(response.comments));
        },
        failure: (error) {
          emit(ShowPostCommentsState.error(error.apiErrorModel.message ?? 'An error occurred'));
        },
      );
    } catch (e) {
      emit(ShowPostCommentsState.error(e.toString()));
    }
  }

  Future<void> addComment(String postId, String comment, String method, String parentCommentId) async {
    try {
      final result = await _commentsRepo.addComment(postId, comment, method, parentCommentId);
      result.when(
        success: (_) {
          // Refresh comments after successful addition
          getPostComments(postId);
        },
        failure: (error) {
          emit(ShowPostCommentsState.error(error.apiErrorModel.message ?? 'Failed to add comment'));
        },
      );
    } catch (e) {
      emit(ShowPostCommentsState.error(e.toString()));
    }
  }
}
