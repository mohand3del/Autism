import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/core/network/response_model.dart';
import 'package:autism/features/home/data/repo/favorite_video_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_from_favorite_state.dart';
part 'remove_from_favorite_cubit.freezed.dart';

class RemoveFromFavoriteCubit extends Cubit<RemoveFromFavoriteState> {
  RemoveFromFavoriteCubit(this._favoriteVideoRepo)
      : super(const RemoveFromFavoriteState.initial());

  final FavoriteVideoRepo _favoriteVideoRepo;

  Future<void> removeFromFavorite({required String videoId}) async {
    emit(const RemoveFromFavoriteState.loading());
    final result =
        await _favoriteVideoRepo.removeFromFavorite(videoId: videoId);

    result.when(
      success: (data) {
        emit(RemoveFromFavoriteState.success(data));
      },
      failure: (error) {
        emit(RemoveFromFavoriteState.error(
           error.apiErrorModel.message ?? ''));
      },
    );
  }
}
