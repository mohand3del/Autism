import 'package:autism/features/home/data/repo/history_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.dart';
part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepo _historyRepo;
  HistoryCubit(this._historyRepo) : super(const HistoryState.initial());

  Future<void> getHistory() async {
    emit(const HistoryState.loading());
    final response = await _historyRepo.getHistory();

    response.when(
      success: (data) {
        emit(HistoryState.success(data));
      },
      failure: (error) {
        emit(HistoryState.failure(error.apiErrorModel.message ?? 'An error occurred'));
      },
    );


  }
}