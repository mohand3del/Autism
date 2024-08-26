part of 'video_cubit.dart';

@freezed
class VideoState<T> with _$VideoState<T> {
  const factory VideoState.initial() = _Initial;
  const factory VideoState.loading() = Loading;
  const factory VideoState.success(T data) = Success;
  const factory VideoState.error(String error) = Error;


}
