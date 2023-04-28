import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/constants/constant.dart';
import 'profile_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(SWSizes.s16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Profile Screen'),
              const SizedBox(height: SWSizes.s16),
              ElevatedButton(
                onPressed: () =>
                    ref.read(profileControllerProvider.notifier).logout(),
                child: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
