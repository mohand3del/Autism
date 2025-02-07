part of 'get_post_by_id_cubit.dart';

@freezed
class GetPostByIdState with _$GetPostByIdState {
  const factory GetPostByIdState.initial() = _Initial;
  const factory GetPostByIdState.loading() = _Loading;
  const factory GetPostByIdState.success(Post post) = _Success;
  const factory GetPostByIdState.error(String message) = _Error;
}
