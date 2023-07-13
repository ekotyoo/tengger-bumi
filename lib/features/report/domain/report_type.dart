enum ReportType {
  post,
  existing,
  impact;

  String get name {
    switch (this) {
      case ReportType.gi:
        return 'Postingan';
      case ReportType.existing:
        return 'Eksisting';
      case ReportType.impact:
        return 'Dampak';
    }
  }
}