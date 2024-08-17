part of 'sign_up_cubit.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;

  const factory SignUpState.signUpLoading() = SignUpLoading;
  const factory SignUpState.signUpSuccess(T data) = SignUpSuccess<T>;
  const factory SignUpState.signUpError({required String error}) = SignUpError;


}
