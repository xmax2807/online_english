// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPublicInfoDTO _$UserPublicInfoDTOFromJson(Map<String, dynamic> json) {
  return User_PublicInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$UserPublicInfoDTO {
  String get id => throw _privateConstructorUsedError;
  Level? get level => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  bool? get isPublicRecord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPublicInfoDTOCopyWith<UserPublicInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPublicInfoDTOCopyWith<$Res> {
  factory $UserPublicInfoDTOCopyWith(
          UserPublicInfoDTO value, $Res Function(UserPublicInfoDTO) then) =
      _$UserPublicInfoDTOCopyWithImpl<$Res, UserPublicInfoDTO>;
  @useResult
  $Res call(
      {String id,
      Level? level,
      String? avatar,
      String? name,
      String? country,
      String? language,
      bool? isPublicRecord});
}

/// @nodoc
class _$UserPublicInfoDTOCopyWithImpl<$Res, $Val extends UserPublicInfoDTO>
    implements $UserPublicInfoDTOCopyWith<$Res> {
  _$UserPublicInfoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = freezed,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? country = freezed,
    Object? language = freezed,
    Object? isPublicRecord = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublicRecord: freezed == isPublicRecord
          ? _value.isPublicRecord
          : isPublicRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$User_PublicInfoDTOCopyWith<$Res>
    implements $UserPublicInfoDTOCopyWith<$Res> {
  factory _$$User_PublicInfoDTOCopyWith(_$User_PublicInfoDTO value,
          $Res Function(_$User_PublicInfoDTO) then) =
      __$$User_PublicInfoDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Level? level,
      String? avatar,
      String? name,
      String? country,
      String? language,
      bool? isPublicRecord});
}

/// @nodoc
class __$$User_PublicInfoDTOCopyWithImpl<$Res>
    extends _$UserPublicInfoDTOCopyWithImpl<$Res, _$User_PublicInfoDTO>
    implements _$$User_PublicInfoDTOCopyWith<$Res> {
  __$$User_PublicInfoDTOCopyWithImpl(
      _$User_PublicInfoDTO _value, $Res Function(_$User_PublicInfoDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = freezed,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? country = freezed,
    Object? language = freezed,
    Object? isPublicRecord = freezed,
  }) {
    return _then(_$User_PublicInfoDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublicRecord: freezed == isPublicRecord
          ? _value.isPublicRecord
          : isPublicRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$User_PublicInfoDTO implements User_PublicInfoDTO {
  _$User_PublicInfoDTO(
      {required this.id,
      required this.level,
      required this.avatar,
      required this.name,
      required this.country,
      required this.language,
      required this.isPublicRecord});

  factory _$User_PublicInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$$User_PublicInfoDTOFromJson(json);

  @override
  final String id;
  @override
  final Level? level;
  @override
  final String? avatar;
  @override
  final String? name;
  @override
  final String? country;
  @override
  final String? language;
  @override
  final bool? isPublicRecord;

  @override
  String toString() {
    return 'UserPublicInfoDTO(id: $id, level: $level, avatar: $avatar, name: $name, country: $country, language: $language, isPublicRecord: $isPublicRecord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$User_PublicInfoDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.isPublicRecord, isPublicRecord) ||
                other.isPublicRecord == isPublicRecord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, level, avatar, name, country, language, isPublicRecord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$User_PublicInfoDTOCopyWith<_$User_PublicInfoDTO> get copyWith =>
      __$$User_PublicInfoDTOCopyWithImpl<_$User_PublicInfoDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$User_PublicInfoDTOToJson(
      this,
    );
  }
}

abstract class User_PublicInfoDTO implements UserPublicInfoDTO {
  factory User_PublicInfoDTO(
      {required final String id,
      required final Level? level,
      required final String? avatar,
      required final String? name,
      required final String? country,
      required final String? language,
      required final bool? isPublicRecord}) = _$User_PublicInfoDTO;

  factory User_PublicInfoDTO.fromJson(Map<String, dynamic> json) =
      _$User_PublicInfoDTO.fromJson;

  @override
  String get id;
  @override
  Level? get level;
  @override
  String? get avatar;
  @override
  String? get name;
  @override
  String? get country;
  @override
  String? get language;
  @override
  bool? get isPublicRecord;
  @override
  @JsonKey(ignore: true)
  _$$User_PublicInfoDTOCopyWith<_$User_PublicInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
