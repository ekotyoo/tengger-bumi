import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:school_watch_semeru/features/school/presentation/add_school/add_school_screen.dart';
import 'package:school_watch_semeru/features/school/presentation/add_school/widgets/floor_plan_maker.dart';
import 'package:school_watch_semeru/features/school/presentation/models/floor_plan_nav_arg.dart';

import '../../features/home/report_detail_screen.dart';
import '../../features/report/presentation/post_report/widgets/location_picker.dart';
import '../../features/home/map_screen.dart';
import '../../features/report/presentation/post_report/post_report_screen.dart';
import '../../features/home/profile_screen.dart';
import '../../features/school/presentation/school_screen.dart';
import '../../features/auth/presentation/login/login_screen.dart';
import '../../features/auth/presentation/register/register_screen.dart';
import '../../features/auth/presentation/welcome/welcome_screen.dart';
import '../../features/home/home_screen.dart';
import 'app_scaffold.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider.autoDispose<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/auth',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: Routes.home,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/schoollist',
            name: Routes.schoolList,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SchoolScreen(),
            ),
          ),
          GoRoute(
            path: '/map',
            name: Routes.map,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const MapScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            name: Routes.profile,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/auth',
        name: Routes.auth,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const WelcomeScreen(),
        ),
        routes: [
          GoRoute(
            path: 'login',
            name: Routes.login,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const LoginScreen(),
            ),
          ),
          GoRoute(
            path: 'register',
            name: Routes.register,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const RegisterScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/postreport',
        name: Routes.postReport,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const PostReportScreen(),
        ),
        routes: [
          GoRoute(
            path: 'locationpicker',
            name: Routes.locationPicker,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              final selectedPosition = state.extra as LatLng?;
              return MaterialPage(
                key: state.pageKey,
                child: LocationPicker(selectedPosition: selectedPosition),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/report',
        name: Routes.reportDetail,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: ReportDetailSreen(),
        ),
      ),
      GoRoute(
        path: '/addschool',
        name: Routes.addSchool,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const MaterialPage(
          child: AddSchoolScreen(),
        ),
        routes: [
          GoRoute(
            path: 'floorplanmaker',
            name: Routes.floorPlanMaker,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              final arg = state.extra as FloorPlanNavArg;
              return MaterialPage(
                child: FloorPlanMaker(
                  rooms: arg.rooms ?? [],
                  roomEditIndex: arg.roomEditIndex,
                ),
              );
            },
          ),
        ],
      ),
    ],
  ),
);
