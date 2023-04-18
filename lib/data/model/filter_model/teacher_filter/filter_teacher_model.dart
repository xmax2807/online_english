import 'nationality.dart';

class FilterModel {
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
}
