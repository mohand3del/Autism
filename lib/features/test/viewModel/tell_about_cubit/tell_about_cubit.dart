import 'package:autism/features/test/data/model/tell_about_request_body.dart';
import 'package:autism/features/test/data/model/tell_about_response_body.dart';
import 'package:autism/features/test/data/repo/tell_about_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tell_about_state.dart';
part 'tell_about_cubit.freezed.dart';

class TellAboutCubit extends Cubit<TellAboutState> {
  final TellAboutRepo _tellAboutRepo;
  TellAboutCubit(this._tellAboutRepo) : super(const TellAboutState.initial());

  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitTellAboutStates({
    required String relation,
    required String gender,
    required String age,
    required String location,
    required String name,
    required String selectedMethods,
  }) async {
    emit(const TellAboutState.loading());

    final response = await _tellAboutRepo.tellAbout(
      TellAboutRequestBody(
        name: nameController.text,
        autismRelation: relation,
        gender: gender,
        age: age,
        location: location,
        methods: selectedMethods,
      ),
    );
    response.when(success: (tellAboutResponseBody) =>
        emit(TellAboutState.success(tellAboutResponseBody)), failure: (error) {
      emit(TellAboutState.error(error: error.apiErrorModel.message.toString() ?? ''));
    })
    ;


  }
}
