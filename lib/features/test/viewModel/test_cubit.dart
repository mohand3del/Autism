import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';
class TestingCubit extends Cubit<List<String>> {
  TestingCubit() : super([]);

  void toggleOption(String option) {
    if (state.contains(option)) {
      emit(List.from(state)..remove(option));
    } else {
      emit(List.from(state)..add(option));
    }
  }
}