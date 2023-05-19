// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) {
  return _LessonModel.fromJson(json);
}

/// @nodoc
mixin _$LessonModel {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonModelCopyWith<LessonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonModelCopyWith<$Res> {
  factory $LessonModelCopyWith(
          LessonModel value, $Res Function(LessonModel) then) =
      _$LessonModelCopyWithImpl<$Res, LessonModel>;
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$LessonModelCopyWithImpl<$Res, $Val extends LessonModel>
    implements $LessonModelCopyWith<$Res> {
  _$LessonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LessonModelCopyWith<$Res>
    implements $LessonModelCopyWith<$Res> {
  factory _$$_LessonModelCopyWith(
          _$_LessonModel value, $Res Function(_$_LessonModel) then) =
      __$$_LessonModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String key,
      String name,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_LessonModelCopyWithImpl<$Res>
    extends _$LessonModelCopyWithImpl<$Res, _$_LessonModel>
    implements _$$_LessonModelCopyWith<$Res> {
  __$$_LessonModelCopyWithImpl(
      _$_LessonModel _value, $Res Function(_$_LessonModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_LessonModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LessonModel implements _LessonModel {
  _$_LessonModel(
      {required this.id,
      required this.key,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  factory _$_LessonModel.fromJson(Map<String, dynamic> json) =>
      _$$_LessonModelFromJson(json);

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'LessonModel(id: $id, key: $key, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LessonModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, key, name, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LessonModelCopyWith<_$_LessonModel> get copyWith =>
      __$$_LessonModelCopyWithImpl<_$_LessonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonModelToJson(
      this,
    );
  }
}

abstract class _LessonModel implements LessonModel {
  factory _LessonModel(
      {required final String id,
      required final String key,
      required final String name,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_LessonModel;

  factory _LessonModel.fromJson(Map<String, dynamic> json) =
      _$_LessonModel.fromJson;

  @override
  String get id;
  @override
  String get key;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_LessonModelCopyWith<_$_LessonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
