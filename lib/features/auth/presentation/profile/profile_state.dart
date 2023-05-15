import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_watch_semeru/features/report/domain/report.dart';

import '../../domain/auth_user.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    AuthUser? user,
    @Default([]) List<Report> reports,
  }) = _ProfileState;
}