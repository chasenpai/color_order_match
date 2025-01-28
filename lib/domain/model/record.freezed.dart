// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Record _$RecordFromJson(Map<String, dynamic> json) {
  return _Record.fromJson(json);
}

/// @nodoc
mixin _$Record {
  int get classic => throw _privateConstructorUsedError;
  int get pastel => throw _privateConstructorUsedError;
  int get neon => throw _privateConstructorUsedError;
  int get vintage => throw _privateConstructorUsedError;

  /// Serializes this Record to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Record
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordCopyWith<Record> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordCopyWith<$Res> {
  factory $RecordCopyWith(Record value, $Res Function(Record) then) =
      _$RecordCopyWithImpl<$Res, Record>;
  @useResult
  $Res call({int classic, int pastel, int neon, int vintage});
}

/// @nodoc
class _$RecordCopyWithImpl<$Res, $Val extends Record>
    implements $RecordCopyWith<$Res> {
  _$RecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Record
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classic = null,
    Object? pastel = null,
    Object? neon = null,
    Object? vintage = null,
  }) {
    return _then(_value.copyWith(
      classic: null == classic
          ? _value.classic
          : classic // ignore: cast_nullable_to_non_nullable
              as int,
      pastel: null == pastel
          ? _value.pastel
          : pastel // ignore: cast_nullable_to_non_nullable
              as int,
      neon: null == neon
          ? _value.neon
          : neon // ignore: cast_nullable_to_non_nullable
              as int,
      vintage: null == vintage
          ? _value.vintage
          : vintage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordImplCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$$RecordImplCopyWith(
          _$RecordImpl value, $Res Function(_$RecordImpl) then) =
      __$$RecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int classic, int pastel, int neon, int vintage});
}

/// @nodoc
class __$$RecordImplCopyWithImpl<$Res>
    extends _$RecordCopyWithImpl<$Res, _$RecordImpl>
    implements _$$RecordImplCopyWith<$Res> {
  __$$RecordImplCopyWithImpl(
      _$RecordImpl _value, $Res Function(_$RecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of Record
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classic = null,
    Object? pastel = null,
    Object? neon = null,
    Object? vintage = null,
  }) {
    return _then(_$RecordImpl(
      classic: null == classic
          ? _value.classic
          : classic // ignore: cast_nullable_to_non_nullable
              as int,
      pastel: null == pastel
          ? _value.pastel
          : pastel // ignore: cast_nullable_to_non_nullable
              as int,
      neon: null == neon
          ? _value.neon
          : neon // ignore: cast_nullable_to_non_nullable
              as int,
      vintage: null == vintage
          ? _value.vintage
          : vintage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordImpl implements _Record {
  const _$RecordImpl(
      {required this.classic,
      required this.pastel,
      required this.neon,
      required this.vintage});

  factory _$RecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordImplFromJson(json);

  @override
  final int classic;
  @override
  final int pastel;
  @override
  final int neon;
  @override
  final int vintage;

  @override
  String toString() {
    return 'Record(classic: $classic, pastel: $pastel, neon: $neon, vintage: $vintage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordImpl &&
            (identical(other.classic, classic) || other.classic == classic) &&
            (identical(other.pastel, pastel) || other.pastel == pastel) &&
            (identical(other.neon, neon) || other.neon == neon) &&
            (identical(other.vintage, vintage) || other.vintage == vintage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, classic, pastel, neon, vintage);

  /// Create a copy of Record
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordImplCopyWith<_$RecordImpl> get copyWith =>
      __$$RecordImplCopyWithImpl<_$RecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordImplToJson(
      this,
    );
  }
}

abstract class _Record implements Record {
  const factory _Record(
      {required final int classic,
      required final int pastel,
      required final int neon,
      required final int vintage}) = _$RecordImpl;

  factory _Record.fromJson(Map<String, dynamic> json) = _$RecordImpl.fromJson;

  @override
  int get classic;
  @override
  int get pastel;
  @override
  int get neon;
  @override
  int get vintage;

  /// Create a copy of Record
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordImplCopyWith<_$RecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
