part of 'history_cubit.dart';

@freezed
class HistoryState<T> with _$HistoryState<T> {
  const factory HistoryState.initial() = _HistoryInitial;
  const factory HistoryState.loading() = HistoryLoading;
  const factory HistoryState.success(T data) = HistorySuccess;
  const factory HistoryState.failure(String message) = HistoryFailure;
}
