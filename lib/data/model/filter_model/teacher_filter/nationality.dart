import '../filter_interface.dart';

class NationalityFilter implements IFilter {
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

  @override
  bool get hasFiltered => isNative != null || isVietNamese != null;

  @override
  void reset() {
    isNative = null;
    isVietNamese = null;
  }

  int? getFilterIndex() {
    if (isNative == isVietNamese) {
      if (isNative == null) return null;
      if (isNative == false) return 2;
    }
    if (isNative != null && isNative == true) return 1;
    if (isVietNamese != null && isVietNamese == true) return 0;
    return null;
  }

  void isOther() {
    isVietNamese = false;
    isNative = false;
  }
}
