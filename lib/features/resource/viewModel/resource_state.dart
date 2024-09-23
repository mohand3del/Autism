part of 'resource_cubit.dart';

@freezed
class ResourceState<T> with _$ResourceState<T> {
  const factory ResourceState.initial() = _Initial;
  const factory ResourceState.loading() = Loading;
  const factory ResourceState.success(T data) = Success;
  const factory ResourceState.error({required String message}) = Error;
}
