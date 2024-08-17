part of 'verify_cubit.dart';

@freezed
class VerifyState<T> with _$VerifyState<T> {
  const factory VerifyState.initial() = _Initial;
  const factory VerifyState.loading() = Loading;
  const factory VerifyState.success(T data) = Success;
  const factory VerifyState.error({required String error}) = Error;
}
