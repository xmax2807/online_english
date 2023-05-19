// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatingData _$RatingDataFromJson(Map<String, dynamic> json) {
  return _RatingData.fromJson(json);
}

/// @nodoc
mixin _$RatingData {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingDataCopyWith<RatingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingDataCopyWith<$Res> {
  factory $RatingDataCopyWith(
          RatingData value, $Res Function(RatingData) then) =
      _$RatingDataCopyWithImpl<$Res, RatingData>;
  @useResult
  $Res call({String label, double value, String comment});
}

/// @nodoc
class _$RatingDataCopyWithImpl<$Res, $Val extends RatingData>
    implements $RatingDataCopyWith<$Res> {
  _$RatingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingDataCopyWith<$Res>
    implements $RatingDataCopyWith<$Res> {
  factory _$$_RatingDataCopyWith(
          _$_RatingData value, $Res Function(_$_RatingData) then) =
      __$$_RatingDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value, String comment});
}

/// @nodoc
class __$$_RatingDataCopyWithImpl<$Res>
    extends _$RatingDataCopyWithImpl<$Res, _$_RatingData>
    implements _$$_RatingDataCopyWith<$Res> {
  __$$_RatingDataCopyWithImpl(
      _$_RatingData _value, $Res Function(_$_RatingData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? comment = null,
  }) {
    return _then(_$_RatingData(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatingData implements _RatingData {
  _$_RatingData(
      {required this.label, required this.value, required this.comment});

  factory _$_RatingData.fromJson(Map<String, dynamic> json) =>
      _$$_RatingDataFromJson(json);

  @override
  final String label;
  @override
  final double value;
  @override
  final String comment;

  @override
  String toString() {
    return 'RatingData(label: $label, value: $value, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingData &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingDataCopyWith<_$_RatingData> get copyWith =>
      __$$_RatingDataCopyWithImpl<_$_RatingData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingDataToJson(
      this,
    );
  }
}

abstract class _RatingData implements RatingData {
  factory _RatingData(
      {required final String label,
      required final double value,
      required final String comment}) = _$_RatingData;

  factory _RatingData.fromJson(Map<String, dynamic> json) =
      _$_RatingData.fromJson;

  @override
  String get label;
  @override
  double get value;
  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$_RatingDataCopyWith<_$_RatingData> get copyWith =>
      throw _privateConstructorUsedError;
}
