part of 'delete_reaction_cubit.dart';

@freezed
class DeleteReactionState<T> with _$DeleteReactionState<T> {
  const factory DeleteReactionState.initial() = _Initial;
  const factory DeleteReactionState.loading() = Loading;
  const factory DeleteReactionState.success(T data) = Success;
  const factory DeleteReactionState.error({required String error}) = Error;

}
