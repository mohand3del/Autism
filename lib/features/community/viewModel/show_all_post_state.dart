part of 'show_all_post_cubit.dart';

@freezed
class ShowAllPostState<T> with _$ShowAllPostState<T> {
  const factory ShowAllPostState.initial() = _Initial;
  const factory ShowAllPostState.loading() = Loading;
  const factory ShowAllPostState.loaded(T data) = Loaded;
  const factory ShowAllPostState.error(String message) = Error;
}
