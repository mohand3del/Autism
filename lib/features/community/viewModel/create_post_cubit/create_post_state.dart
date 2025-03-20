part of 'create_post_cubit.dart';

@freezed
class CreatePostState<T> with _$CreatePostState<T> {
  const factory CreatePostState.initial() = _Initial;
  const factory CreatePostState.loading() = Loading;
  const factory CreatePostState.success(T data) = Success;
  const factory CreatePostState.error({required String error}) = Error;
  const factory CreatePostState.imageSelected(File image) = ImageSelected;

}
