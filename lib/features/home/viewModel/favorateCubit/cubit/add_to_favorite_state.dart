part of 'add_to_favorite_cubit.dart';

@freezed
class AddToFavoriteState with _$AddToFavoriteState {
  const factory AddToFavoriteState.initial() = _Initial;
  const factory AddToFavoriteState.loading() = Loading;
  const factory AddToFavoriteState.success(ApiResponse data) = Success;
  const factory AddToFavoriteState.error(String error) = Error;
}
