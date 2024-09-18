part of 'tell_about_cubit.dart';

@freezed
class TellAboutState<T> with _$TellAboutState<T> {
  const factory TellAboutState.initial() = _Initial;

  const factory TellAboutState.loading() = Loading;

  const factory TellAboutState.success(T data) = Success;

  const factory TellAboutState.error({required String error}) = Error;

}
