import 'package:autism/features/community/data/repo/delete_reaction_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_reaction_state.dart';
part 'delete_reaction_cubit.freezed.dart';

class DeleteReactionCubit extends Cubit<DeleteReactionState> {
  DeleteReactionCubit(this._deleteReactionRepo) : super(const DeleteReactionState.initial());
  final DeleteReactionRepo _deleteReactionRepo;

  Future<void> deleteReaction(String postId) async {
    emit(const DeleteReactionState.loading());
    final response = await _deleteReactionRepo.deleteReaction(postId);
    response.when(success: (data) {
      emit(DeleteReactionState.success(data));
    }, failure: (error) {
      emit(DeleteReactionState.error(error: error.apiErrorModel.message.toString()));
    });
  }
}
