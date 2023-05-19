class CourseOverviewDTO {
  String id;
  String name;
  CourseOverviewDTO({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CourseOverviewDTO.fromJson(Map<String, dynamic> json) =>
      CourseOverviewDTO(id: json['id'], name: json['name']);
}
