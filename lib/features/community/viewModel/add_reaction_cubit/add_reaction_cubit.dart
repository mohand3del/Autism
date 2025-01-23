import 'package:autism/features/community/data/model/add_reaction_request_body.dart';
import 'package:autism/features/community/data/model/add_reaction_response.dart';
import 'package:autism/features/community/data/repo/add_reaction_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_reaction_state.dart';
part 'add_reaction_cubit.freezed.dart';

class AddReactionCubit extends Cubit<AddReactionState> {
  AddReactionCubit(this._addReactionRepo) : super(const AddReactionState.initial());
  final AddReactionRepo _addReactionRepo;

  void addReaction(AddReactionRequestBody addReactionRequestBody, String postId) async {
    emit(const AddReactionState.loading());
    final response = await _addReactionRepo.addReaction(postId: postId,addReactionRequestBody);
    response.when(success: (data) {
      emit(const AddReactionState.success());
    }, failure: (error) {
      emit(AddReactionState.error(error: error.apiErrorModel.message.toString()));
    });
  }
}
