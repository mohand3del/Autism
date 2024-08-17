part of 'forget_cubit.dart';

@freezed
class ForgetState<T> with _$ForgetState<T> {
  const factory ForgetState.initial() = _Initial;
  const factory ForgetState.loading() = Loading;
  const factory ForgetState.success(T data) = Success<T>;
  const factory ForgetState.error({required String error}) = Error;
}
