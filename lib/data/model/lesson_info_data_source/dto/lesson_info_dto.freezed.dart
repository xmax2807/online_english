// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LessonInfoDTO _$LessonInfoDTOFromJson(Map<String, dynamic> json) {
  return _LessonInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$LessonInfoDTO {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonInfoDTOCopyWith<LessonInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonInfoDTOCopyWith<$Res> {
  factory $LessonInfoDTOCopyWith(
          LessonInfoDTO value, $Res Function(LessonInfoDTO) then) =
      _$LessonInfoDTOCopyWithImpl<$Res, LessonInfoDTO>;
  @useResult
  $Res call({String id, String key, String name});
}

/// @nodoc
class _$LessonInfoDTOCopyWithImpl<$Res, $Val extends LessonInfoDTO>
    implements $LessonInfoDTOCopyWith<$Res> {
  _$LessonInfoDTOCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LessonInfoDTOCopyWith<$Res>
    implements $LessonInfoDTOCopyWith<$Res> {
  factory _$$_LessonInfoDTOCopyWith(
          _$_LessonInfoDTO value, $Res Function(_$_LessonInfoDTO) then) =
      __$$_LessonInfoDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String key, String name});
}

/// @nodoc
class __$$_LessonInfoDTOCopyWithImpl<$Res>
    extends _$LessonInfoDTOCopyWithImpl<$Res, _$_LessonInfoDTO>
    implements _$$_LessonInfoDTOCopyWith<$Res> {
  __$$_LessonInfoDTOCopyWithImpl(
      _$_LessonInfoDTO _value, $Res Function(_$_LessonInfoDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? name = null,
  }) {
    return _then(_$_LessonInfoDTO(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LessonInfoDTO implements _LessonInfoDTO {
  _$_LessonInfoDTO({required this.id, required this.key, required this.name});

  factory _$_LessonInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LessonInfoDTOFromJson(json);

  @override
  final String id;
  @override
  final String key;
  @override
  final String name;

  @override
  String toString() {
    return 'LessonInfoDTO(id: $id, key: $key, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LessonInfoDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, key, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LessonInfoDTOCopyWith<_$_LessonInfoDTO> get copyWith =>
      __$$_LessonInfoDTOCopyWithImpl<_$_LessonInfoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonInfoDTOToJson(
      this,
    );
  }
}

abstract class _LessonInfoDTO implements LessonInfoDTO {
  factory _LessonInfoDTO(
      {required final String id,
      required final String key,
      required final String name}) = _$_LessonInfoDTO;

  factory _LessonInfoDTO.fromJson(Map<String, dynamic> json) =
      _$_LessonInfoDTO.fromJson;

  @override
  String get id;
  @override
  String get key;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_LessonInfoDTOCopyWith<_$_LessonInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
