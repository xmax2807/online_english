// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_table_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleTableDTO _$ScheduleTableDTOFromJson(Map<String, dynamic> json) {
  return _ScheduleTableDTO.fromJson(json);
}

/// @nodoc
mixin _$ScheduleTableDTO {
  String get id => throw _privateConstructorUsedError;
  String get tutorId => throw _privateConstructorUsedError;
  List<ScheduleDetailModel> get scheduleDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleTableDTOCopyWith<ScheduleTableDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleTableDTOCopyWith<$Res> {
  factory $ScheduleTableDTOCopyWith(
          ScheduleTableDTO value, $Res Function(ScheduleTableDTO) then) =
      _$ScheduleTableDTOCopyWithImpl<$Res, ScheduleTableDTO>;
  @useResult
  $Res call(
      {String id, String tutorId, List<ScheduleDetailModel> scheduleDetails});
}

/// @nodoc
class _$ScheduleTableDTOCopyWithImpl<$Res, $Val extends ScheduleTableDTO>
    implements $ScheduleTableDTOCopyWith<$Res> {
  _$ScheduleTableDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tutorId = null,
    Object? scheduleDetails = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tutorId: null == tutorId
          ? _value.tutorId
          : tutorId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleDetails: null == scheduleDetails
          ? _value.scheduleDetails
          : scheduleDetails // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDetailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleTableDTOCopyWith<$Res>
    implements $ScheduleTableDTOCopyWith<$Res> {
  factory _$$_ScheduleTableDTOCopyWith(
          _$_ScheduleTableDTO value, $Res Function(_$_ScheduleTableDTO) then) =
      __$$_ScheduleTableDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String tutorId, List<ScheduleDetailModel> scheduleDetails});
}

/// @nodoc
class __$$_ScheduleTableDTOCopyWithImpl<$Res>
    extends _$ScheduleTableDTOCopyWithImpl<$Res, _$_ScheduleTableDTO>
    implements _$$_ScheduleTableDTOCopyWith<$Res> {
  __$$_ScheduleTableDTOCopyWithImpl(
      _$_ScheduleTableDTO _value, $Res Function(_$_ScheduleTableDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tutorId = null,
    Object? scheduleDetails = null,
  }) {
    return _then(_$_ScheduleTableDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tutorId: null == tutorId
          ? _value.tutorId
          : tutorId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleDetails: null == scheduleDetails
          ? _value._scheduleDetails
          : scheduleDetails // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDetailModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleTableDTO implements _ScheduleTableDTO {
  _$_ScheduleTableDTO(
      {required this.id,
      required this.tutorId,
      required final List<ScheduleDetailModel> scheduleDetails})
      : _scheduleDetails = scheduleDetails;

  factory _$_ScheduleTableDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleTableDTOFromJson(json);

  @override
  final String id;
  @override
  final String tutorId;
  final List<ScheduleDetailModel> _scheduleDetails;
  @override
  List<ScheduleDetailModel> get scheduleDetails {
    if (_scheduleDetails is EqualUnmodifiableListView) return _scheduleDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleDetails);
  }

  @override
  String toString() {
    return 'ScheduleTableDTO(id: $id, tutorId: $tutorId, scheduleDetails: $scheduleDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleTableDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tutorId, tutorId) || other.tutorId == tutorId) &&
            const DeepCollectionEquality()
                .equals(other._scheduleDetails, _scheduleDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tutorId,
      const DeepCollectionEquality().hash(_scheduleDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleTableDTOCopyWith<_$_ScheduleTableDTO> get copyWith =>
      __$$_ScheduleTableDTOCopyWithImpl<_$_ScheduleTableDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleTableDTOToJson(
      this,
    );
  }
}

abstract class _ScheduleTableDTO implements ScheduleTableDTO {
  factory _ScheduleTableDTO(
          {required final String id,
          required final String tutorId,
          required final List<ScheduleDetailModel> scheduleDetails}) =
      _$_ScheduleTableDTO;

  factory _ScheduleTableDTO.fromJson(Map<String, dynamic> json) =
      _$_ScheduleTableDTO.fromJson;

  @override
  String get id;
  @override
  String get tutorId;
  @override
  List<ScheduleDetailModel> get scheduleDetails;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleTableDTOCopyWith<_$_ScheduleTableDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
