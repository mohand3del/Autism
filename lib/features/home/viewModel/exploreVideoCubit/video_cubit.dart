import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/video_response_body.dart';
import '../../data/repo/video_repo.dart';

part 'video_state.dart';
part 'video_cubit.freezed.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepo _videoRepo;
  bool _isFetchingData = false;
  bool _isFirstTime = true;
  bool _hasMoreData = true;
  String? _nextPageToken;
  final List<FullDatum> _allVideos = [];

  VideoCubit(this._videoRepo) : super(const VideoState.initial());

  bool get isFetchingData => _isFetchingData;
  List<FullDatum> get allVideos => _allVideos;

  bool get hasMoreData => _hasMoreData;

  void getVideos({
    String? search,
    String? videoDuration,
    String? videoCategoryId,
    bool isLoadMore = false,
  }) async {
    if (_isFetchingData) return;

    _isFetchingData = true;
    if (_isFirstTime) {
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
        _hasMoreData = _nextPageToken != null && data.fullData.isNotEmpty;
        _handleSuccess(data, isLoadMore);
      },
      failure: (error) {
        emit(VideoState.error(error.apiErrorModel.message ?? 'An error occurred'));
      },
    );

    _isFetchingData = false;
    _isFirstTime = false;
  }

  void _handleSuccess(VideoResponseBody data, bool isLoadMore) {
    if (isLoadMore) {
      _allVideos.addAll(data.fullData);
    } else {
      _allVideos.clear();
      _allVideos.addAll(data.fullData);
    }

    emit(VideoState.success(VideoResponseBody(
      nextPageToken: data.nextPageToken,
      prevPageToken: data.prevPageToken,
      fullData: _allVideos,
    )));
  }

  void loadMoreVideos({
    String? search,
    String? videoDuration,
    String? videoCategoryId,
  }) {
    if (_hasMoreData) {
      getVideos(
        search: search,
        videoDuration: videoDuration,
        videoCategoryId: videoCategoryId,
        isLoadMore: true,
      );
    }
  }
}
