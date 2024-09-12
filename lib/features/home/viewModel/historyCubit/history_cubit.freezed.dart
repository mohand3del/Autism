// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HistoryInitial<T> value) initial,
    required TResult Function(HistoryLoading<T> value) loading,
    required TResult Function(HistorySuccess<T> value) success,
    required TResult Function(HistoryFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryInitial<T> value)? initial,
    TResult? Function(HistoryLoading<T> value)? loading,
    TResult? Function(HistorySuccess<T> value)? success,
    TResult? Function(HistoryFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryInitial<T> value)? initial,
    TResult Function(HistoryLoading<T> value)? loading,
    TResult Function(HistorySuccess<T> value)? success,
    TResult Function(HistoryFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<T, $Res> {
  factory $HistoryStateCopyWith(
          HistoryState<T> value, $Res Function(HistoryState<T>) then) =
      _$HistoryStateCopyWithImpl<T, $Res, HistoryState<T>>;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<T, $Res, $Val extends HistoryState<T>>
    implements $HistoryStateCopyWith<T, $Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HistoryInitialImplCopyWith<T, $Res> {
  factory _$$HistoryInitialImplCopyWith(_$HistoryInitialImpl<T> value,
          $Res Function(_$HistoryInitialImpl<T>) then) =
      __$$HistoryInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$HistoryInitialImplCopyWithImpl<T, $Res>
    extends _$HistoryStateCopyWithImpl<T, $Res, _$HistoryInitialImpl<T>>
    implements _$$HistoryInitialImplCopyWith<T, $Res> {
  __$$HistoryInitialImplCopyWithImpl(_$HistoryInitialImpl<T> _value,
      $Res Function(_$HistoryInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HistoryInitialImpl<T> implements _HistoryInitial<T> {
  const _$HistoryInitialImpl();

  @override
  String toString() {
    return 'HistoryState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HistoryInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
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
    required TResult Function(_HistoryInitial<T> value) initial,
    required TResult Function(HistoryLoading<T> value) loading,
    required TResult Function(HistorySuccess<T> value) success,
    required TResult Function(HistoryFailure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryInitial<T> value)? initial,
    TResult? Function(HistoryLoading<T> value)? loading,
    TResult? Function(HistorySuccess<T> value)? success,
    TResult? Function(HistoryFailure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryInitial<T> value)? initial,
    TResult Function(HistoryLoading<T> value)? loading,
    TResult Function(HistorySuccess<T> value)? success,
    TResult Function(HistoryFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _HistoryInitial<T> implements HistoryState<T> {
  const factory _HistoryInitial() = _$HistoryInitialImpl<T>;
}

/// @nodoc
abstract class _$$HistoryLoadingImplCopyWith<T, $Res> {
  factory _$$HistoryLoadingImplCopyWith(_$HistoryLoadingImpl<T> value,
          $Res Function(_$HistoryLoadingImpl<T>) then) =
      __$$HistoryLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$HistoryLoadingImplCopyWithImpl<T, $Res>
    extends _$HistoryStateCopyWithImpl<T, $Res, _$HistoryLoadingImpl<T>>
    implements _$$HistoryLoadingImplCopyWith<T, $Res> {
  __$$HistoryLoadingImplCopyWithImpl(_$HistoryLoadingImpl<T> _value,
      $Res Function(_$HistoryLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HistoryLoadingImpl<T> implements HistoryLoading<T> {
  const _$HistoryLoadingImpl();

  @override
  String toString() {
    return 'HistoryState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HistoryLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
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
    required TResult Function(_HistoryInitial<T> value) initial,
    required TResult Function(HistoryLoading<T> value) loading,
    required TResult Function(HistorySuccess<T> value) success,
    required TResult Function(HistoryFailure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryInitial<T> value)? initial,
    TResult? Function(HistoryLoading<T> value)? loading,
    TResult? Function(HistorySuccess<T> value)? success,
    TResult? Function(HistoryFailure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryInitial<T> value)? initial,
    TResult Function(HistoryLoading<T> value)? loading,
    TResult Function(HistorySuccess<T> value)? success,
    TResult Function(HistoryFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HistoryLoading<T> implements HistoryState<T> {
  const factory HistoryLoading() = _$HistoryLoadingImpl<T>;
}

/// @nodoc
abstract class _$$HistorySuccessImplCopyWith<T, $Res> {
  factory _$$HistorySuccessImplCopyWith(_$HistorySuccessImpl<T> value,
          $Res Function(_$HistorySuccessImpl<T>) then) =
      __$$HistorySuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$HistorySuccessImplCopyWithImpl<T, $Res>
    extends _$HistoryStateCopyWithImpl<T, $Res, _$HistorySuccessImpl<T>>
    implements _$$HistorySuccessImplCopyWith<T, $Res> {
  __$$HistorySuccessImplCopyWithImpl(_$HistorySuccessImpl<T> _value,
      $Res Function(_$HistorySuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$HistorySuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$HistorySuccessImpl<T> implements HistorySuccess<T> {
  const _$HistorySuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'HistoryState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistorySuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistorySuccessImplCopyWith<T, _$HistorySuccessImpl<T>> get copyWith =>
      __$$HistorySuccessImplCopyWithImpl<T, _$HistorySuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HistoryInitial<T> value) initial,
    required TResult Function(HistoryLoading<T> value) loading,
    required TResult Function(HistorySuccess<T> value) success,
    required TResult Function(HistoryFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryInitial<T> value)? initial,
    TResult? Function(HistoryLoading<T> value)? loading,
    TResult? Function(HistorySuccess<T> value)? success,
    TResult? Function(HistoryFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryInitial<T> value)? initial,
    TResult Function(HistoryLoading<T> value)? loading,
    TResult Function(HistorySuccess<T> value)? success,
    TResult Function(HistoryFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class HistorySuccess<T> implements HistoryState<T> {
  const factory HistorySuccess(final T data) = _$HistorySuccessImpl<T>;

  T get data;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistorySuccessImplCopyWith<T, _$HistorySuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryFailureImplCopyWith<T, $Res> {
  factory _$$HistoryFailureImplCopyWith(_$HistoryFailureImpl<T> value,
          $Res Function(_$HistoryFailureImpl<T>) then) =
      __$$HistoryFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HistoryFailureImplCopyWithImpl<T, $Res>
    extends _$HistoryStateCopyWithImpl<T, $Res, _$HistoryFailureImpl<T>>
    implements _$$HistoryFailureImplCopyWith<T, $Res> {
  __$$HistoryFailureImplCopyWithImpl(_$HistoryFailureImpl<T> _value,
      $Res Function(_$HistoryFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$HistoryFailureImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HistoryFailureImpl<T> implements HistoryFailure<T> {
  const _$HistoryFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HistoryState<$T>.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryFailureImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryFailureImplCopyWith<T, _$HistoryFailureImpl<T>> get copyWith =>
      __$$HistoryFailureImplCopyWithImpl<T, _$HistoryFailureImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HistoryInitial<T> value) initial,
    required TResult Function(HistoryLoading<T> value) loading,
    required TResult Function(HistorySuccess<T> value) success,
    required TResult Function(HistoryFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HistoryInitial<T> value)? initial,
    TResult? Function(HistoryLoading<T> value)? loading,
    TResult? Function(HistorySuccess<T> value)? success,
    TResult? Function(HistoryFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HistoryInitial<T> value)? initial,
    TResult Function(HistoryLoading<T> value)? loading,
    TResult Function(HistorySuccess<T> value)? success,
    TResult Function(HistoryFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class HistoryFailure<T> implements HistoryState<T> {
  const factory HistoryFailure(final String message) = _$HistoryFailureImpl<T>;

  String get message;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryFailureImplCopyWith<T, _$HistoryFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
