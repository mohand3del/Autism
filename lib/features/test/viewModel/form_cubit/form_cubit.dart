import 'package:autism/features/test/data/model/form_request_body.dart';
import 'package:autism/features/test/data/repo/form_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_state.dart';
part 'form_cubit.freezed.dart';

class FormCubit extends Cubit<FormState> {
  final FormRepo _formRepo;
  FormCubit(this._formRepo) : super(const FormState.initial());

  Future<void> submitForm({
    required String q1,
    required String q2,
    required String q3,
    required String q4,
    required String q5,
    required String q6,
    required String q7,
    required String q8,
    required String q9,
    required String q10,
}) async {
    emit(const FormState.loading());
    final response = await _formRepo.submitForm(
      FormRequestBody(
        q1: q1,
        q2: q2,
        q3: q3,
        q4: q4,
        q5: q5,
        q6: q6,
        q7: q7,
        q8: q8,
        q9: q9,
        q10: q10,
      ),
    );
    response.when(success: (formResponseBody) =>
        emit(FormState.success(formResponseBody)), failure: (error) {
      emit(FormState.error( error.apiErrorModel.message.toString() ?? ''));
    });

  }
}
