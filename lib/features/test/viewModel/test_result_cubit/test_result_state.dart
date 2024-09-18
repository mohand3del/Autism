part of 'test_result_cubit.dart';

@freezed
class TestResultState<T> with _$TestResultState<T> {
  const factory TestResultState.initial() = _Initial;

  const factory TestResultState.loading() = TestResultLoading;

  const factory TestResultState.success({required bool autism}) = TestResultSuccess;

  const factory TestResultState.error({required String error}) = TestResultError;
}
