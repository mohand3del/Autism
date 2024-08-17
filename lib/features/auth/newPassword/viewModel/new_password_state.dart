part of 'new_password_cubit.dart';

@freezed
class NewPasswordState<T> with _$NewPasswordState<T> {
  const factory NewPasswordState.initial() = _Initial;
  const factory NewPasswordState.loading() = Loading;
  const factory NewPasswordState.success(T data) = Success<T>;
  const factory NewPasswordState.error({required String error}) = Error;
}
