import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_watch_semeru/features/report/post_report/widgets/pick_report_type_form.dart';

import 'widgets/pick_school_form.dart';

part './post_report_form_state.dart';

class PostReportFormNotifier extends StateNotifier<PostReportFormState> {
  PostReportFormNotifier() : super(const PostReportFormState());

  void onPageChange(int page) => state = state.copyWith(currentPage: page);

  void onSchoolSelected(SchoolOption school) =>
      state = state.copyWith(selectedSchool: school);

  void onReportTypeSelected(ReportType type) {
    state = state.copyWith(selectedReportType: type);
  }
}

final postReportFormNotifierProvider = StateNotifierProvider.autoDispose<
    PostReportFormNotifier, PostReportFormState>(
  (ref) => PostReportFormNotifier(),
);
