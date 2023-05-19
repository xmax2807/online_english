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

  UpcomingSchedultPagingDTO.history({
    this.page = 1,
    this.perPage = 20,
    this.orderBy = 'meeting',
    this.sortBy = 'desc',
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

  Map<String, dynamic> toHistoryJson() {
    return {
      'page': page,
      'perPage': perPage,
      'dateTimeLte': dateTimeGte,
      'orderBy': orderBy,
      'sortBy': sortBy,
    };
  }
}
