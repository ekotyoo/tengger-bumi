enum ReportTime {
  all,
  aDayAgo,
  threeDayAgo,
  aWeekAgo,
  aMonthAgo;

  String get name {
    switch (this) {
      case ReportTime.all:
        return 'Semua';
      case ReportTime.aDayAgo:
        return '1 Hari Terakhir';
      case ReportTime.threeDayAgo:
        return '3 Hari Yang Terakhir';
      case ReportTime.aWeekAgo:
        return '1 Minggu Yang Terakhir';
      case ReportTime.aMonthAgo:
        return '1 Bulan Yang Lalu';
    }
  }
}
