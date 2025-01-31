part of 'show_post_comments_cubit.dart';

@freezed
class ShowPostCommentsState with _$ShowPostCommentsState {
  const factory ShowPostCommentsState.initial() = _Initial;
  const factory ShowPostCommentsState.loading() = _Loading;
  const factory ShowPostCommentsState.success(List<Comment> comments) = _Success;
  const factory ShowPostCommentsState.error(String message) = _Error;
}
