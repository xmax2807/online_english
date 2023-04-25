class UpcomingSchedultPagingDTO {
  int page;
  int perPage;
  late int dateTimeGte;
  String orderBy;
  String sortBy;

  UpcomingSchedultPagingDTO({
    this.page = 1,
    this.perPage = 20,
    this.orderBy = 'meeting',
    this.sortBy = 'asc',
  }) {
    dateTimeGte = DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'perPage': perPage,
      'dateTimeGte': dateTimeGte,
      'orderBy': orderBy,
      'sortBy': sortBy,
    };
  }
}
