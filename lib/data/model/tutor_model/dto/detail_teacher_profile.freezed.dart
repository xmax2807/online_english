// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_teacher_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeacherDetailDTO _$TeacherDetailDTOFromJson(Map<String, dynamic> json) {
  return _TeacherDetailDTO.fromJson(json);
}

/// @nodoc
mixin _$TeacherDetailDTO {
  String? get video => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String? get education => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get profession => throw _privateConstructorUsedError;
  String? get interests => throw _privateConstructorUsedError;
  String? get languages => throw _privateConstructorUsedError;
  String? get specialties => throw _privateConstructorUsedError;
  double? get avgRating => throw _privateConstructorUsedError;
  int? get totalFeedback => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: "User")
  UserPublicInfoDTO get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherDetailDTOCopyWith<TeacherDetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherDetailDTOCopyWith<$Res> {
  factory $TeacherDetailDTOCopyWith(
          TeacherDetailDTO value, $Res Function(TeacherDetailDTO) then) =
      _$TeacherDetailDTOCopyWithImpl<$Res, TeacherDetailDTO>;
  @useResult
  $Res call(
      {String? video,
      String bio,
      String? education,
      String? experience,
      String? profession,
      String? interests,
      String? languages,
      String? specialties,
      double? avgRating,
      int? totalFeedback,
      bool? isFavorite,
      @JsonKey(name: "User") UserPublicInfoDTO user});

  $UserPublicInfoDTOCopyWith<$Res> get user;
}

/// @nodoc
class _$TeacherDetailDTOCopyWithImpl<$Res, $Val extends TeacherDetailDTO>
    implements $TeacherDetailDTOCopyWith<$Res> {
  _$TeacherDetailDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? bio = null,
    Object? education = freezed,
    Object? experience = freezed,
    Object? profession = freezed,
    Object? interests = freezed,
    Object? languages = freezed,
    Object? specialties = freezed,
    Object? avgRating = freezed,
    Object? totalFeedback = freezed,
    Object? isFavorite = freezed,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String?,
      specialties: freezed == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as String?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double?,
      totalFeedback: freezed == totalFeedback
          ? _value.totalFeedback
          : totalFeedback // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserPublicInfoDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPublicInfoDTOCopyWith<$Res> get user {
    return $UserPublicInfoDTOCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TeacherDetailDTOCopyWith<$Res>
    implements $TeacherDetailDTOCopyWith<$Res> {
  factory _$$_TeacherDetailDTOCopyWith(
          _$_TeacherDetailDTO value, $Res Function(_$_TeacherDetailDTO) then) =
      __$$_TeacherDetailDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? video,
      String bio,
      String? education,
      String? experience,
      String? profession,
      String? interests,
      String? languages,
      String? specialties,
      double? avgRating,
      int? totalFeedback,
      bool? isFavorite,
      @JsonKey(name: "User") UserPublicInfoDTO user});

  @override
  $UserPublicInfoDTOCopyWith<$Res> get user;
}

/// @nodoc
class __$$_TeacherDetailDTOCopyWithImpl<$Res>
    extends _$TeacherDetailDTOCopyWithImpl<$Res, _$_TeacherDetailDTO>
    implements _$$_TeacherDetailDTOCopyWith<$Res> {
  __$$_TeacherDetailDTOCopyWithImpl(
      _$_TeacherDetailDTO _value, $Res Function(_$_TeacherDetailDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? bio = null,
    Object? education = freezed,
    Object? experience = freezed,
    Object? profession = freezed,
    Object? interests = freezed,
    Object? languages = freezed,
    Object? specialties = freezed,
    Object? avgRating = freezed,
    Object? totalFeedback = freezed,
    Object? isFavorite = freezed,
    Object? user = null,
  }) {
    return _then(_$_TeacherDetailDTO(
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String?,
      specialties: freezed == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as String?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double?,
      totalFeedback: freezed == totalFeedback
          ? _value.totalFeedback
          : totalFeedback // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserPublicInfoDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeacherDetailDTO implements _TeacherDetailDTO {
  _$_TeacherDetailDTO(
      {required this.video,
      required this.bio,
      required this.education,
      required this.experience,
      required this.profession,
      required this.interests,
      required this.languages,
      required this.specialties,
      required this.avgRating,
      required this.totalFeedback,
      required this.isFavorite,
      @JsonKey(name: "User") required this.user});

  factory _$_TeacherDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TeacherDetailDTOFromJson(json);

  @override
  final String? video;
  @override
  final String bio;
  @override
  final String? education;
  @override
  final String? experience;
  @override
  final String? profession;
  @override
  final String? interests;
  @override
  final String? languages;
  @override
  final String? specialties;
  @override
  final double? avgRating;
  @override
  final int? totalFeedback;
  @override
  final bool? isFavorite;
  @override
  @JsonKey(name: "User")
  final UserPublicInfoDTO user;

  @override
  String toString() {
    return 'TeacherDetailDTO(video: $video, bio: $bio, education: $education, experience: $experience, profession: $profession, interests: $interests, languages: $languages, specialties: $specialties, avgRating: $avgRating, totalFeedback: $totalFeedback, isFavorite: $isFavorite, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeacherDetailDTO &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.interests, interests) ||
                other.interests == interests) &&
            (identical(other.languages, languages) ||
                other.languages == languages) &&
            (identical(other.specialties, specialties) ||
                other.specialties == specialties) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating) &&
            (identical(other.totalFeedback, totalFeedback) ||
                other.totalFeedback == totalFeedback) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      video,
      bio,
      education,
      experience,
      profession,
      interests,
      languages,
      specialties,
      avgRating,
      totalFeedback,
      isFavorite,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeacherDetailDTOCopyWith<_$_TeacherDetailDTO> get copyWith =>
      __$$_TeacherDetailDTOCopyWithImpl<_$_TeacherDetailDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeacherDetailDTOToJson(
      this,
    );
  }
}

abstract class _TeacherDetailDTO implements TeacherDetailDTO {
  factory _TeacherDetailDTO(
          {required final String? video,
          required final String bio,
          required final String? education,
          required final String? experience,
          required final String? profession,
          required final String? interests,
          required final String? languages,
          required final String? specialties,
          required final double? avgRating,
          required final int? totalFeedback,
          required final bool? isFavorite,
          @JsonKey(name: "User") required final UserPublicInfoDTO user}) =
      _$_TeacherDetailDTO;

  factory _TeacherDetailDTO.fromJson(Map<String, dynamic> json) =
      _$_TeacherDetailDTO.fromJson;

  @override
  String? get video;
  @override
  String get bio;
  @override
  String? get education;
  @override
  String? get experience;
  @override
  String? get profession;
  @override
  String? get interests;
  @override
  String? get languages;
  @override
  String? get specialties;
  @override
  double? get avgRating;
  @override
  int? get totalFeedback;
  @override
  bool? get isFavorite;
  @override
  @JsonKey(name: "User")
  UserPublicInfoDTO get user;
  @override
  @JsonKey(ignore: true)
  _$$_TeacherDetailDTOCopyWith<_$_TeacherDetailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
