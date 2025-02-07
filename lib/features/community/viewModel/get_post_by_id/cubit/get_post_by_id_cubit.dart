import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/model/get_post_by_id_response.dart';
import '../../../data/repo/get_post_by_id_repo.dart';

part 'get_post_by_id_state.dart';
part 'get_post_by_id_cubit.freezed.dart';

class GetPostByIdCubit extends Cubit<GetPostByIdState> {
  final GetPostByIdRepo _getPostByIdRepo;

  GetPostByIdCubit(this._getPostByIdRepo) : super(const GetPostByIdState.initial());

  Future<void> getPostById(String postId) async {
    emit(const GetPostByIdState.loading());
    final result = await _getPostByIdRepo.getPostById(postId);
    result.when(
      success: (response) {
        emit(GetPostByIdState.success(response.post));
      },
      failure: (error) {
        emit(GetPostByIdState.error(error.apiErrorModel.message ?? 'Error loading post'));
      },
    );
  }
}
