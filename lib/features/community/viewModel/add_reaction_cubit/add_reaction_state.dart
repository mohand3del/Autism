part of 'add_reaction_cubit.dart';

@freezed
class AddReactionState<T> with _$AddReactionState<T> {
  const factory AddReactionState.initial() = _Initial;
  const factory AddReactionState.loading() = Loading;
  const factory AddReactionState.success() = Success;
  const factory AddReactionState.error({required String error}) = Error;

}
