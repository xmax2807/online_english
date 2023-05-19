// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopicModel _$TopicModelFromJson(Map<String, dynamic> json) {
  return _TopicModel.fromJson(json);
}

/// @nodoc
mixin _$TopicModel {
  String get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  int get orderCourse => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameFile => throw _privateConstructorUsedError;
  int? get numberOfPages => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicModelCopyWith<TopicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicModelCopyWith<$Res> {
  factory $TopicModelCopyWith(
          TopicModel value, $Res Function(TopicModel) then) =
      _$TopicModelCopyWithImpl<$Res, TopicModel>;
  @useResult
  $Res call(
      {String id,
      String courseId,
      int orderCourse,
      String name,
      String nameFile,
      int? numberOfPages,
      String description,
      String? videoUrl});
}

/// @nodoc
class _$TopicModelCopyWithImpl<$Res, $Val extends TopicModel>
    implements $TopicModelCopyWith<$Res> {
  _$TopicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? orderCourse = null,
    Object? name = null,
    Object? nameFile = null,
    Object? numberOfPages = freezed,
    Object? description = null,
    Object? videoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      orderCourse: null == orderCourse
          ? _value.orderCourse
          : orderCourse // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameFile: null == nameFile
          ? _value.nameFile
          : nameFile // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPages: freezed == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopicModelCopyWith<$Res>
    implements $TopicModelCopyWith<$Res> {
  factory _$$_TopicModelCopyWith(
          _$_TopicModel value, $Res Function(_$_TopicModel) then) =
      __$$_TopicModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String courseId,
      int orderCourse,
      String name,
      String nameFile,
      int? numberOfPages,
      String description,
      String? videoUrl});
}

/// @nodoc
class __$$_TopicModelCopyWithImpl<$Res>
    extends _$TopicModelCopyWithImpl<$Res, _$_TopicModel>
    implements _$$_TopicModelCopyWith<$Res> {
  __$$_TopicModelCopyWithImpl(
      _$_TopicModel _value, $Res Function(_$_TopicModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? orderCourse = null,
    Object? name = null,
    Object? nameFile = null,
    Object? numberOfPages = freezed,
    Object? description = null,
    Object? videoUrl = freezed,
  }) {
    return _then(_$_TopicModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      orderCourse: null == orderCourse
          ? _value.orderCourse
          : orderCourse // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameFile: null == nameFile
          ? _value.nameFile
          : nameFile // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfPages: freezed == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopicModel implements _TopicModel {
  _$_TopicModel(
      {required this.id,
      required this.courseId,
      required this.orderCourse,
      required this.name,
      required this.nameFile,
      required this.numberOfPages,
      required this.description,
      required this.videoUrl});

  factory _$_TopicModel.fromJson(Map<String, dynamic> json) =>
      _$$_TopicModelFromJson(json);

  @override
  final String id;
  @override
  final String courseId;
  @override
  final int orderCourse;
  @override
  final String name;
  @override
  final String nameFile;
  @override
  final int? numberOfPages;
  @override
  final String description;
  @override
  final String? videoUrl;

  @override
  String toString() {
    return 'TopicModel(id: $id, courseId: $courseId, orderCourse: $orderCourse, name: $name, nameFile: $nameFile, numberOfPages: $numberOfPages, description: $description, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopicModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.orderCourse, orderCourse) ||
                other.orderCourse == orderCourse) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameFile, nameFile) ||
                other.nameFile == nameFile) &&
            (identical(other.numberOfPages, numberOfPages) ||
                other.numberOfPages == numberOfPages) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, orderCourse, name,
      nameFile, numberOfPages, description, videoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopicModelCopyWith<_$_TopicModel> get copyWith =>
      __$$_TopicModelCopyWithImpl<_$_TopicModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopicModelToJson(
      this,
    );
  }
}

abstract class _TopicModel implements TopicModel {
  factory _TopicModel(
      {required final String id,
      required final String courseId,
      required final int orderCourse,
      required final String name,
      required final String nameFile,
      required final int? numberOfPages,
      required final String description,
      required final String? videoUrl}) = _$_TopicModel;

  factory _TopicModel.fromJson(Map<String, dynamic> json) =
      _$_TopicModel.fromJson;

  @override
  String get id;
  @override
  String get courseId;
  @override
  int get orderCourse;
  @override
  String get name;
  @override
  String get nameFile;
  @override
  int? get numberOfPages;
  @override
  String get description;
  @override
  String? get videoUrl;
  @override
  @JsonKey(ignore: true)
  _$$_TopicModelCopyWith<_$_TopicModel> get copyWith =>
      throw _privateConstructorUsedError;
}
