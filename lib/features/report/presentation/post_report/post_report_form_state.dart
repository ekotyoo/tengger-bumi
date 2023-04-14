part of './post_report_form_notifier.dart';

class PostReportFormState extends Equatable {
  const PostReportFormState({
    this.currentPage = 0,
    this.selectedSchool,
    this.selectedReportType,
  });

  final int currentPage;
  final SchoolOption? selectedSchool;
  final ReportType? selectedReportType;

  PostReportFormState copyWith({
    int? currentPage,
    SchoolOption? selectedSchool,
    ReportType? selectedReportType,
  }) {
    return PostReportFormState(
      currentPage: currentPage ?? this.currentPage,
      selectedSchool: selectedSchool ?? this.selectedSchool,
      selectedReportType: selectedReportType ?? this.selectedReportType,
    );
  }

  @override
  List<Object?> get props => [currentPage, selectedSchool, selectedReportType];
}
