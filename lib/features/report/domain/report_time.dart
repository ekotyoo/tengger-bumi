class TimeBetween {
  final DateTime from;
  final DateTime to;

  TimeBetween(this.from, this.to);
}

enum ReportTime {
  today,
  aWeekAgo,
  twoWeekAgo,
  aMonthAgo,
  threeMonthAgo,
  sixMonthAgo,
  aYearAgo;

  String get name {
    switch (this) {
      case ReportTime.today:
        return 'Hari Ini';
      case ReportTime.aWeekAgo:
        return '1 Minggu';
      case ReportTime.twoWeekAgo:
        return '2 Minggu';
      case ReportTime.aMonthAgo:
        return '1 Bulan';
      case ReportTime.threeMonthAgo:
        return '3 Bulan';
      case ReportTime.sixMonthAgo:
        return '6 Bulan';
      case ReportTime.aYearAgo:
        return '1 Tahun';
    }
  }

  TimeBetween get timeBetween {
    final DateTime to = DateTime.now();
    switch (this) {
      case ReportTime.today:
        final from = DateTime(to.year, to.month, to.day);
        return TimeBetween(from, to);
      case ReportTime.aWeekAgo:
        final from = DateTime(to.year, to.month, to.day).subtract(const Duration(days: 7));
        return TimeBetween(from, to);
      case ReportTime.twoWeekAgo:
        final from = DateTime(to.year, to.month, to.day).subtract(const Duration(days: 7 * 2));
        return TimeBetween(from, to);
      case ReportTime.aMonthAgo:
        final from = DateTime(to.year, to.month, to.day).subtract(const Duration(days: 30));
        return TimeBetween(from, to);
      case ReportTime.threeMonthAgo:
        final from = DateTime(to.year, to.month, to.day).subtract(const Duration(days: 30 * 3));
        return TimeBetween(from, to);
      case ReportTime.sixMonthAgo:
        final from = DateTime(to.year, to.month, to.day).subtract(const Duration(days: 30 * 6));
        return TimeBetween(from, to);
      case ReportTime.aYearAgo:
        final from = DateTime(to.year, to.month, to.day).subtract(const Duration(days: 365));
        return TimeBetween(from, to);
    }
  }
}
