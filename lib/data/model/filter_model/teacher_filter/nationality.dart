class NationalityFilter {
  bool? isNative;
  bool? isVietNamese;
  NationalityFilter({this.isNative, this.isVietNamese});
  factory NationalityFilter.fromJson(Map<String, dynamic> json) {
    return NationalityFilter(
      isNative: json['isNative'],
      isVietNamese: json['isVietNamese'],
    );
  }

  Map<String, dynamic> toJson() {
    if (isVietNamese == null && isNative == null) return {};
    return {
      'isVietNamese': isVietNamese,
      'isNative': isNative,
    };
  }
}
