class CancelReasonModel {
  final int id;
  final String reason;

  CancelReasonModel(this.id, this.reason);

  Map<String, dynamic> toJson() => {
        'id': id,
        'reason': reason,
      };

  factory CancelReasonModel.fromJson(Map<String, dynamic> json) {
    return CancelReasonModel(
      json['id'],
      json['reason'],
    );
  }
}
