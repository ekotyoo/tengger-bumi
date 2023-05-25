import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'common/constants/constant.dart';
import 'common/routing/app_router.dart';
import 'common/theming/sw_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
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
