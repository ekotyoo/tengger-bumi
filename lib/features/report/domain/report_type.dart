enum ReportType {
  post,
  existing,
  impact;

  String get name {
    switch (this) {
      case ReportType.post:
        return 'Postingan';
      case ReportType.existing:
        return 'Eksisting';
      case ReportType.impact:
        return 'Dampak';
    }
  }
}