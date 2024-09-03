import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/data/repo/channel_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_state.dart';
part 'channel_cubit.freezed.dart';

class ChannelCubit extends Cubit<ChannelState> {
  final ChannelRepo _channelRepo;
  bool _isFetchingData = false;
  bool _isFirstTime = true;
  bool _hasMoreData = true;
  String? _nextPageToken;
  final List<FullDatum> _allChannels = [];

  ChannelCubit(this._channelRepo) : super(const ChannelState.initial());

  bool get isFetchingData => _isFetchingData;
  List<FullDatum> get allChannels => _allChannels;
  bool get hasMoreData => _hasMoreData;

  void getChannels({
    String? search,
    bool isLoadMore = false,
  }) async {
    if (_isFetchingData) return;

    _isFetchingData = true;
    if (_isFirstTime) {
      emit(const ChannelState.loading());
    }

    final response = await _channelRepo.getChannels(
      search: search,
      pageToken: _nextPageToken,
    );

    response.when(
      success: (data) {
        _nextPageToken = data.nextPageToken;
        _hasMoreData = _nextPageToken != null && data.fullData.isNotEmpty;
        _handleSuccess(data, isLoadMore);
      },
      failure: (error) {
        emit(ChannelState.error(error.apiErrorModel.message ?? 'An error occurred'));
      },
    );

    _isFetchingData = false;
    _isFirstTime = false;
  }

  void _handleSuccess(ChannelResponseBody data, bool isLoadMore) {
    if (isLoadMore) {
      _allChannels.addAll(data.fullData);
    } else {
      _allChannels.clear();
      _allChannels.addAll(data.fullData);
    }

    emit(ChannelState.success(ChannelResponseBody(
      nextPageToken: data.nextPageToken,
      prevPageToken: data.prevPageToken,
      fullData: _allChannels,
    )));
  }

  void loadMoreChannels({
    String? search,
  }) {
    if (_hasMoreData) {
      getChannels(
        search: search,
        isLoadMore: true,
      );
    }
  }

  void getChannelById({String? channelId}) async {
    final response = await _channelRepo.getChannelById(channelId: channelId);

    response.when(
      success: (data) {
        emit(ChannelState.success(data));
      },
      failure: (error) {
        emit(ChannelState.error(error.apiErrorModel.message ?? 'An error occurred'));
      },
    );
  }
}
