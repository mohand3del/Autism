import 'package:autism/features/home/data/model/channel_response_body.dart';
import 'package:autism/features/home/data/repo/channel_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_state.dart';
part 'channel_cubit.freezed.dart';

class ChannelCubit extends Cubit<ChannelState> {
  final ChannelRepo _channelRepo;
  ChannelCubit(this._channelRepo) : super(const ChannelState.initial());
  String? _PageToken;

  void getChannels({
    String? search,

    bool isLoadMore = false,
  }) async {
    if (state is Loading) return;

    if (!isLoadMore) {
      emit(const ChannelState.loading());
    }

    final response = await _channelRepo.getChannels(
      search: search,
      pageToken: _PageToken,

    );

    response.when(
      success: (data) {
        _PageToken = data.nextPageToken;

        if (isLoadMore && state is Success<ChannelResponseBody>) {
          final currentState = state as Success<ChannelResponseBody>;
          final currentChannels = currentState.channelResponseBody.fullData;
          final newChannels = data.fullData;
          final allChannels = List<FullDatum>.from(currentChannels)..addAll(newChannels);

          final updatedResponse = ChannelResponseBody(
            nextPageToken: data.nextPageToken,
            prevPageToken: data.prevPageToken,
            fullData: allChannels,
          );

          emit(ChannelState.success(updatedResponse));
        } else {
          emit(ChannelState.success(data));
        }
      },
      failure: (error) {
        emit(ChannelState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }

  void loadMoreChannels({
    String? search,

  }) {
    if (_PageToken != null) {
      getChannels(
        search: search,
        isLoadMore: true,
      );
    }
  }
}
