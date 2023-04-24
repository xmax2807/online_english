import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class BookingInfoModel {
  final String id;
  final bool isDeleted;
  final String scheduleDetailId;
  final int? cancelReasonId;
  final String userId;

  BookingInfoModel(
    this.id,
    this.isDeleted,
    this.scheduleDetailId,
    this.cancelReasonId,
    this.userId,
  );

  factory BookingInfoModel.fromJson(Map<String, dynamic> json) {
    return BookingInfoModel(
      json['id'],
      json['isDeleted'],
      json['scheduleDetailId'],
      json['cancelReasonId'],
      json['userId'],
    );
  }
}
