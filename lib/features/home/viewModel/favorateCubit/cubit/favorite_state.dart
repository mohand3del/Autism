part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = Loading;
  const factory FavoriteState.success(FavoriteVideoResponseModel data) = Success;
  const factory FavoriteState.error(String error) = Error;
}
