enum ReportStatus {
  active,
  inactive;

  String get name {
    switch (this) {
      case ReportStatus.active:
        return 'Aktif';
      case ReportStatus.inactive:
        return 'Tidak Aktif';
    }
  }
}