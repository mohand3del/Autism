import 'package:autism/features/home/data/repo/video_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/video_response_body.dart';

part 'video_state.dart';
part 'video_cubit.freezed.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepo _videoRepo;
  VideoCubit(this._videoRepo) : super(const VideoState.initial());

  String? _nextPageToken;

  void getVideos({
    String? search,
    String? videoDuration,
    String? videoCategoryId,
    bool isLoadMore = false,
  }) async {
    if (state is Loading) return;

    if (!isLoadMore) {
      emit(const VideoState.loading());
    }

    final response = await _videoRepo.getVideos(
      search: search,
      pageToken: _nextPageToken,
      videoDuration: videoDuration,
      videoCategoryId: videoCategoryId,
    );

    response.when(
      success: (data) {
        _nextPageToken = data.nextPageToken;

        if (isLoadMore && state is Success<VideoResponseBody>) {
          final currentState = state as Success<VideoResponseBody>;
          final currentVideos = currentState.data.fullData;
          final newVideos = data.fullData;
          final allVideos = List<FullDatum>.from(currentVideos)..addAll(newVideos);

          final updatedResponse = VideoResponseBody(
            nextPageToken: data.nextPageToken,
            prevPageToken: data.prevPageToken,
            fullData: allVideos,
          );

          emit(VideoState.success(updatedResponse));
        } else {
          emit(VideoState.success(data));
        }
      },
      failure: (error) {
        emit(VideoState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }

  void loadMoreVideos({
    String? search,
    String? videoDuration,
    String? videoCategoryId,
  }) {
    if (_nextPageToken != null) {
      getVideos(
        search: search,
        videoDuration: videoDuration,
        videoCategoryId: videoCategoryId,
        isLoadMore: true,
      );
    }
  }
}
