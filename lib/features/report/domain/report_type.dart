enum ReportType {
  all,
  prevention,
  existing,
  impact;

  String get name {
    switch (this) {
      case ReportType.all:
        return 'Semua';
      case ReportType.prevention:
        return 'Pencegahan';
      case ReportType.existing:
        return 'Eksisting';
      case ReportType.impact:
        return 'Dampak';
    }
  }
}