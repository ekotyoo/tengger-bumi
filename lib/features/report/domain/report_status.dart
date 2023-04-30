enum ReportStatus {
  all,
  active,
  inactive;

  String get name {
    switch (this) {
      case ReportStatus.all:
        return 'Semua';
      case ReportStatus.active:
        return 'Aktif';
      case ReportStatus.inactive:
        return 'Tidak Aktif';
    }
  }
}