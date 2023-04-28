import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth_controller.dart';
import '../../domain/auth_user.dart';

part 'profile_controller.g.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.user,
    this.isLoading = false,
  });

  final AuthUser? user;
  final bool isLoading;

  @override
  List<Object?> get props => [user, isLoading];
}

@riverpod
class ProfileController extends _$ProfileController {
  @override
  ProfileState build() => const ProfileState();

  void logout() async {
    ref.read(authControllerProvider.notifier).logout();
  }
}
