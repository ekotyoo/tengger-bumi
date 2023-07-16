import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tetenger_bumi/features/report/domain/plant.dart';

import '../../../../common/models/statistic.dart';
import '../../domain/auth_user.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    AuthUser? user,
    @Default([]) List<Plant> reports,
    @Default([]) List<Statistic> stats,
    @Default(0) int total,
  }) = _ProfileState;
}