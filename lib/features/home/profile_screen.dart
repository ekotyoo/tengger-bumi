import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_watch_semeru/common/constants/constant.dart';
import 'package:school_watch_semeru/common/routing/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => context.goNamed(Routes.auth),
                child: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
