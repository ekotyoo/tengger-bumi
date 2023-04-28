import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'common/constants/constant.dart';
import 'common/routing/app_router.dart';
import 'common/theming/sw_theme.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider.notifier);
    final routerConfig = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/splash',
      routes: appRouter.routes,
      redirect: appRouter.redirect,
      refreshListenable: appRouter,
      debugLogDiagnostics: true,
    );

    return MaterialApp.router(
      title: SWStrings.appName,
      theme: SWTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
    );
  }
}
