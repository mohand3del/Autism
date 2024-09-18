import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/features/test/data/repo/test_result_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_result_state.dart';
part 'test_result_cubit.freezed.dart';

class TestResultCubit extends Cubit<TestResultState> {
  final TestResultRepo _testResultRepo;
  TestResultCubit(this._testResultRepo) : super(const TestResultState.initial());

  void getTestResult() async {
    emit(const TestResultState.loading());
    final result = await _testResultRepo.getTestResult();
    result.when(
      success: (response) {
        emit(TestResultState.success(autism: response.testResult == 1));
      },
      failure: (error) {
        emit(TestResultState.error(error: ErrorHandler.handle(error).toString()));
      },
    );
  }
}
