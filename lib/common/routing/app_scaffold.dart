import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';
import 'bottom_nav_bar.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: widget.child),
        BottomNavBar(
          onTap: _onTap,
          currentIndex: _calculateCurrentIndex(context),
        ),
      ],
    );
  }

  int _calculateCurrentIndex(BuildContext context) {
    final route = GoRouter.of(context);
    final location = route.location;

    if (location.startsWith('/home')) {
      return 0;
    } else if (location.startsWith('/map')) {
      return 1;
    } else if (location.startsWith('/postreport')) {
      return 2;
    } else if (location.startsWith('/schoollist')) {
      return 3;
    } else if (location.startsWith('/profile')) {
      return 4;
    }

    return 0;
  }

  void _onTap(int value) {
    switch (value) {
      case 0:
        context.goNamed(Routes.home);
        break;
      case 1:
        context.goNamed(Routes.map);
        break;
      case 2:
        context.pushNamed(Routes.postReport);
        break;
      case 3:
        context.goNamed(Routes.schoolList);
        break;
      case 4:
        context.goNamed(Routes.profile);
        break;
      default:
        context.goNamed(Routes.home);
        break;
    }
  }
}
