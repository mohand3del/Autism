part of 'form_cubit.dart';

@freezed
class FormState<T> with _$FormState<T> {
  const factory FormState.initial() = _Initial;
  const factory FormState.loading() = Loading;
  const factory FormState.success(T data) = Success;
  const factory FormState.error(String message) = Error;
}
