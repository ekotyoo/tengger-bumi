import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/routing/routes.dart';
import '../../../school/presentation/school_detail/school_detail_screen.dart';
import '../../../../common/constants/constant.dart';
import 'profile_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text(SWStrings.labelEditProfile),
                  onTap: () => context.pushNamed(Routes.editProfile),
                ),
                PopupMenuItem(
                  child: const Text(SWStrings.labelLogout),
                  onTap: () =>
                      ref.read(profileControllerProvider.notifier).logout(),
                ),
              ],
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(SWSizes.s16),
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: SWSizes.s32),
            const ReportListWithFilter(),
          ],
        ),
      ),
    );
  }

  _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: SWSizes.s56,
        ),
        const SizedBox(height: SWSizes.s16),
        Text(
          'John Doe',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SWSizes.s4),
        Text(
          'johndoe@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: kColorNeutral100),
        ),
      ],
    );
  }
}
