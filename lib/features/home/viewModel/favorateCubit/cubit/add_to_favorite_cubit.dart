import 'package:autism/core/network/response_model.dart';
import 'package:autism/features/home/data/repo/favorite_video_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_favorite_state.dart';
part 'add_to_favorite_cubit.freezed.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  AddToFavoriteCubit(this._favoriteVideoRepo)
      : super(const AddToFavoriteState.initial());

  final FavoriteVideoRepo _favoriteVideoRepo;

  Future<void> addToFavorite({required String videoId}) async {
    emit(const AddToFavoriteState.loading());
    final result = await _favoriteVideoRepo.addToFavorite(videoId: videoId);

    result.when(
      success: (data) {
        emit(AddToFavoriteState.success(data));
      },
      failure: (error) {
        emit(AddToFavoriteState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
