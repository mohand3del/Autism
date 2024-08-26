part of 'channel_cubit.dart';

@freezed
class ChannelState<T> with _$ChannelState<T> {
  const factory ChannelState.initial() = _Initial;
  const factory ChannelState.loading() = Loading;
  const factory ChannelState.success(ChannelResponseBody channelResponseBody) = Success;
  const factory ChannelState.error(String error) = Error;
}
