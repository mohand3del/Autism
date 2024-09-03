part of 'video_by_id_cubit.dart';

@freezed
class VideoByIdState<T> with _$VideoByIdState<T> {
  const factory VideoByIdState.initial() = _Initial;
  const factory VideoByIdState.loading() = Loading;
  const factory VideoByIdState.success(VideoByIdResponseBody data) = Success;
  const factory VideoByIdState.error(String error) = Error;
}
