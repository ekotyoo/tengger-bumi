import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/routing/routes.dart';
import '../../../school/presentation/school_detail/school_detail_screen.dart';
import '../../../../common/constants/constant.dart';
import '../../domain/auth_user.dart';
import 'profile_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(profileControllerProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelProfile),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SWSizes.s8),
              ),
              itemBuilder: (context) => stateAsync.when(
                data: (data) {
                  return [
                    PopupMenuItem(
                      child: const Text(SWStrings.labelEditProfile),
                      onTap: () => context.pushNamed(Routes.editProfile, extra: data.user),
                    ),
                    PopupMenuItem(
                      child: const Text(SWStrings.labelLogout),
                      onTap: () =>
                          ref.read(profileControllerProvider.notifier).logout(),
                    ),
                  ];
                },
                error: (error, stackTrace) => [],
                loading: () => [],
              ),
            ),
          ],
        ),
        body: stateAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => const Center(child: Text('error')),
          data: (state) {
            return ListView(
              padding: const EdgeInsets.all(SWSizes.s16),
              children: [
                _buildProfileHeader(context, state.user),
                const SizedBox(height: SWSizes.s32),
                ReportListWithFilter(reports: state.reports, stats: state.stats, total: state.total,),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildProfileHeader(BuildContext context, AuthUser? user) {
    if (user == null) return Container();
    return user.map(
      signedIn: (userSignedIn) => Column(
        children: [
          CircleAvatar(
            radius: SWSizes.s56,
            foregroundImage: userSignedIn.avatar != null
                ? NetworkImage(userSignedIn.avatar!)
                : null,
            backgroundColor: kColorPrimary50,
            child: const Icon(Icons.person,
                color: kColorPrimary100, size: SWSizes.s56),
          ),
          const SizedBox(height: SWSizes.s16),
          Text(
            userSignedIn.name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: SWSizes.s4),
          Text(
            userSignedIn.email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: kColorNeutral100),
          ),
        ],
      ),
      signedOut: (value) => Container(),
    );
  }
}
