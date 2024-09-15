// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_result_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TestResultState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool autism) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool autism)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool autism)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TestResultLoading<T> value) loading,
    required TResult Function(TestResultSuccess<T> value) success,
    required TResult Function(TestResultError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TestResultLoading<T> value)? loading,
    TResult? Function(TestResultSuccess<T> value)? success,
    TResult? Function(TestResultError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TestResultLoading<T> value)? loading,
    TResult Function(TestResultSuccess<T> value)? success,
    TResult Function(TestResultError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestResultStateCopyWith<T, $Res> {
  factory $TestResultStateCopyWith(
          TestResultState<T> value, $Res Function(TestResultState<T>) then) =
      _$TestResultStateCopyWithImpl<T, $Res, TestResultState<T>>;
}

/// @nodoc
class _$TestResultStateCopyWithImpl<T, $Res, $Val extends TestResultState<T>>
    implements $TestResultStateCopyWith<T, $Res> {
  _$TestResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$TestResultStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TestResultState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool autism) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool autism)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool autism)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TestResultLoading<T> value) loading,
    required TResult Function(TestResultSuccess<T> value) success,
    required TResult Function(TestResultError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TestResultLoading<T> value)? loading,
    TResult? Function(TestResultSuccess<T> value)? success,
    TResult? Function(TestResultError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TestResultLoading<T> value)? loading,
    TResult Function(TestResultSuccess<T> value)? success,
    TResult Function(TestResultError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements TestResultState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$TestResultLoadingImplCopyWith<T, $Res> {
  factory _$$TestResultLoadingImplCopyWith(_$TestResultLoadingImpl<T> value,
          $Res Function(_$TestResultLoadingImpl<T>) then) =
      __$$TestResultLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$TestResultLoadingImplCopyWithImpl<T, $Res>
    extends _$TestResultStateCopyWithImpl<T, $Res, _$TestResultLoadingImpl<T>>
    implements _$$TestResultLoadingImplCopyWith<T, $Res> {
  __$$TestResultLoadingImplCopyWithImpl(_$TestResultLoadingImpl<T> _value,
      $Res Function(_$TestResultLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TestResultLoadingImpl<T> implements TestResultLoading<T> {
  const _$TestResultLoadingImpl();

  @override
  String toString() {
    return 'TestResultState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestResultLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool autism) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool autism)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool autism)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TestResultLoading<T> value) loading,
    required TResult Function(TestResultSuccess<T> value) success,
    required TResult Function(TestResultError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TestResultLoading<T> value)? loading,
    TResult? Function(TestResultSuccess<T> value)? success,
    TResult? Function(TestResultError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TestResultLoading<T> value)? loading,
    TResult Function(TestResultSuccess<T> value)? success,
    TResult Function(TestResultError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TestResultLoading<T> implements TestResultState<T> {
  const factory TestResultLoading() = _$TestResultLoadingImpl<T>;
}

/// @nodoc
abstract class _$$TestResultSuccessImplCopyWith<T, $Res> {
  factory _$$TestResultSuccessImplCopyWith(_$TestResultSuccessImpl<T> value,
          $Res Function(_$TestResultSuccessImpl<T>) then) =
      __$$TestResultSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool autism});
}

/// @nodoc
class __$$TestResultSuccessImplCopyWithImpl<T, $Res>
    extends _$TestResultStateCopyWithImpl<T, $Res, _$TestResultSuccessImpl<T>>
    implements _$$TestResultSuccessImplCopyWith<T, $Res> {
  __$$TestResultSuccessImplCopyWithImpl(_$TestResultSuccessImpl<T> _value,
      $Res Function(_$TestResultSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autism = null,
  }) {
    return _then(_$TestResultSuccessImpl<T>(
      autism: null == autism
          ? _value.autism
          : autism // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TestResultSuccessImpl<T> implements TestResultSuccess<T> {
  const _$TestResultSuccessImpl({required this.autism});

  @override
  final bool autism;

  @override
  String toString() {
    return 'TestResultState<$T>.success(autism: $autism)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestResultSuccessImpl<T> &&
            (identical(other.autism, autism) || other.autism == autism));
  }

  @override
  int get hashCode => Object.hash(runtimeType, autism);

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestResultSuccessImplCopyWith<T, _$TestResultSuccessImpl<T>>
      get copyWith =>
          __$$TestResultSuccessImplCopyWithImpl<T, _$TestResultSuccessImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool autism) success,
    required TResult Function(String error) error,
  }) {
    return success(autism);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool autism)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(autism);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool autism)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(autism);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TestResultLoading<T> value) loading,
    required TResult Function(TestResultSuccess<T> value) success,
    required TResult Function(TestResultError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TestResultLoading<T> value)? loading,
    TResult? Function(TestResultSuccess<T> value)? success,
    TResult? Function(TestResultError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TestResultLoading<T> value)? loading,
    TResult Function(TestResultSuccess<T> value)? success,
    TResult Function(TestResultError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TestResultSuccess<T> implements TestResultState<T> {
  const factory TestResultSuccess({required final bool autism}) =
      _$TestResultSuccessImpl<T>;

  bool get autism;

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestResultSuccessImplCopyWith<T, _$TestResultSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TestResultErrorImplCopyWith<T, $Res> {
  factory _$$TestResultErrorImplCopyWith(_$TestResultErrorImpl<T> value,
          $Res Function(_$TestResultErrorImpl<T>) then) =
      __$$TestResultErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$TestResultErrorImplCopyWithImpl<T, $Res>
    extends _$TestResultStateCopyWithImpl<T, $Res, _$TestResultErrorImpl<T>>
    implements _$$TestResultErrorImplCopyWith<T, $Res> {
  __$$TestResultErrorImplCopyWithImpl(_$TestResultErrorImpl<T> _value,
      $Res Function(_$TestResultErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$TestResultErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TestResultErrorImpl<T> implements TestResultError<T> {
  const _$TestResultErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'TestResultState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestResultErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestResultErrorImplCopyWith<T, _$TestResultErrorImpl<T>> get copyWith =>
      __$$TestResultErrorImplCopyWithImpl<T, _$TestResultErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool autism) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool autism)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool autism)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(TestResultLoading<T> value) loading,
    required TResult Function(TestResultSuccess<T> value) success,
    required TResult Function(TestResultError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(TestResultLoading<T> value)? loading,
    TResult? Function(TestResultSuccess<T> value)? success,
    TResult? Function(TestResultError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(TestResultLoading<T> value)? loading,
    TResult Function(TestResultSuccess<T> value)? success,
    TResult Function(TestResultError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TestResultError<T> implements TestResultState<T> {
  const factory TestResultError({required final String error}) =
      _$TestResultErrorImpl<T>;

  String get error;

  /// Create a copy of TestResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestResultErrorImplCopyWith<T, _$TestResultErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
