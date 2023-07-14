enum ReportType {
  post,
  statistic;

  String get name {
    switch (this) {
      case ReportType.post:
        return 'Posting';
      case ReportType.statistic:
        return 'Statistic';
    }
  }
}