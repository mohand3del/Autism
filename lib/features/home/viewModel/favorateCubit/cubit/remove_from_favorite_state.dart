part of 'remove_from_favorite_cubit.dart';

@freezed
class RemoveFromFavoriteState with _$RemoveFromFavoriteState {
  const factory RemoveFromFavoriteState.initial() = _Initial;
  const factory RemoveFromFavoriteState.loading() = Loading;
  const factory RemoveFromFavoriteState.success(ApiResponse data) = Success;
  const factory RemoveFromFavoriteState.error(String error) = Error;
}
