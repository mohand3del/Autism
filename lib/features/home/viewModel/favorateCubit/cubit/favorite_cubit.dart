import 'package:autism/core/network/api_error_handler.dart';
import 'package:autism/features/home/data/model/favorite_video_response_model.dart';
import 'package:autism/features/home/data/repo/favorite_video_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._favoriteVideoRepo) : super(FavoriteState.initial());

  final FavoriteVideoRepo _favoriteVideoRepo;
  final List<FullData?> _favoriteVideos = [];

  List<FullData?> get favoriteVideos => _favoriteVideos;

  Future<void> getFavoriteVideos({required int skipVideo}) async {
    emit(const FavoriteState.loading());
    final result =
        await _favoriteVideoRepo.getFavoriteVideos(skipVideo: skipVideo);

    result.when(
      success: (data) {
        emit(FavoriteState.success(data));
      },
      failure: (error) {
        emit(FavoriteState.error(ErrorHandler.handle(error).toString()));
      },
    );
  }

  Future<void> deleteAllFavorites() async {
    emit(const FavoriteState.loading());
    final result = await _favoriteVideoRepo.deleteAllFavorites();

    result.when(
      success: (data) {
        _favoriteVideos.clear();
        emit(FavoriteState.success(FavoriteVideoResponseModel(
          fullData: FullData(videos: [], channels: []),
        )));
      },
      failure: (error) {
        emit(FavoriteState.error(ErrorHandler.handle(error).toString()));
      },
    );
  }
}
