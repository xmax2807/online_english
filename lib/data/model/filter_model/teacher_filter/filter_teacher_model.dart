import 'package:online_english/data/model/filter_model/filter_interface.dart';

import 'nationality.dart';

class FilterModel implements IFilter {
  late DateTime? date;
  late List<String?> tutoringTimeAvailable;
  late List<String> specialties;
  late NationalityFilter nationality;
  FilterModel() {
    date = null;
    tutoringTimeAvailable = [null, null];
    specialties = [];
    nationality = NationalityFilter();
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'tutoringTimeAvailable': tutoringTimeAvailable,
      'specialties': specialties,
      'nationality': nationality.toJson(),
    };
  }

  @override
  // TODO: implement hasFiltered
  bool get hasFiltered => specialties.isNotEmpty || nationality.hasFiltered;

  @override
  void reset() {
    date = null;
    tutoringTimeAvailable = [];
    specialties = [];
    nationality.reset();
  }
}
