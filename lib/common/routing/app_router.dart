import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/common/widgets/image_viewer.dart';
import 'package:school_watch_semeru/features/auth/domain/auth_user.dart';
import 'package:school_watch_semeru/features/auth/presentation/edit_profile/edit_profile_screen.dart';
import 'package:school_watch_semeru/features/auth/presentation/email_verification/email_verification_screen.dart';
import 'package:school_watch_semeru/features/report/presentation/map/map_screen.dart';
import 'package:school_watch_semeru/features/school/presentation/edit_school/edit_school_screen.dart';

import '../../features/report/presentation/report_detail/report_detail_screen.dart';
import '../../features/school/presentation/models/school_detail_floor_plan_nav_arg.dart';
import '../../features/school/presentation/school_detail/school_detail_screen.dart';
import '../../features/school/presentation/school_detail/school_floor_plan_screen.dart';
import '../../features/auth/auth_controller.dart';
import '../../features/school/presentation/add_school/add_school_screen.dart';
import '../../features/school/presentation/add_school/widgets/floor_plan_maker.dart';
import '../../features/school/presentation/models/floor_plan_nav_arg.dart';
import '../../features/report/presentation/post_report/widgets/location_picker.dart';
import '../../features/report/presentation/post_report/post_report_screen.dart';
import '../../features/auth/presentation/profile/profile_screen.dart';
import '../../features/school/presentation/school_list/school_list_screen.dart';
import '../../features/auth/presentation/login/login_screen.dart';
import '../../features/auth/presentation/register/register_screen.dart';
import '../../features/auth/presentation/welcome/welcome_screen.dart';
import '../../features/report/presentation/report_feed/report_feed_screen.dart';
import '../widgets/splash_overlay.dart';
import 'app_scaffold.dart';
import 'routes.dart';

part 'app_router.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@riverpod
class AppRouter extends _$AppRouter implements Listenable {
  VoidCallback? routerListener;
  bool authenticated = false;

  @override
  Future<void> build() async {
    authenticated = await ref.watch(
      authControllerProvider.selectAsync(
        (data) => data.map(
          signedIn: (_) => true,
          signedOut: (_) => false,
        ),
      ),
    );

    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    final isSplash = state.location == '/splash';

    final loggingIn = state.location.contains('/auth') ||
        state.location.contains('login') ||
        state.location.contains('register');

    if (isSplash) {
      return authenticated ? '/home' : '/auth';
    }

    if (loggingIn) return authenticated ? '/home' : null;

    return authenticated ? null : '/splash';
  }

  List<RouteBase> get routes => [
        GoRoute(
          path: '/splash',
          name: Routes.splash,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const SplashOverlay(),
          ),
        ),
        ShellRoute(
          builder: (context, state, child) => AppScaffold(child: child),
          routes: [
            GoRoute(
              path: '/home',
              name: Routes.home,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ReportFeedScreen(),
              ),
            ),
            GoRoute(
              path: '/schoollist',
              name: Routes.schoolList,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const SchoolListScreen(),
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
            GoRoute(
              path: 'verify',
              name: Routes.emailVerification,
              pageBuilder: (context, state) {
                final email = state.extra as String?;
                return MaterialPage(
                  key: state.pageKey,
                  child: EmailVerificationScreen(email: email),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/postreport',
          name: Routes.postReport,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const PostReportScreen(),
          ),
        ),
        GoRoute(
          path: '/editreport/:reportId',
          name: Routes.editReport,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) {
            final params = state.params['reportId'];
            if (params == null) throw Exception();

            final reportId = int.parse(params);
            return MaterialPage(
              key: state.pageKey,
              child: PostReportScreen(
                formType: FormType.edit,
                reportId: reportId,
              ),
            );
          },
        ),
        GoRoute(
          path: '/locationpicker',
          name: Routes.locationPicker,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) {
            final arg = state.extra as LatLng?;
            return MaterialPage(
              key: state.pageKey,
              child: LocationPicker(
                selectedPosition: arg
              ),
            );
          },
        ),
        GoRoute(
          path: '/report/:reportId',
          name: Routes.reportDetail,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) {
            final params = state.params['reportId'];
            if (params == null) throw Exception();
            final reportId = int.parse(params);

            return MaterialPage(
              child: ReportDetailScreen(
                reportId: reportId,
              ),
            );
          },
        ),
        GoRoute(
          path: '/addschool',
          name: Routes.addSchool,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) => const MaterialPage(
            child: AddSchoolScreen(),
          ),
          routes: [
            GoRoute(
              path: 'floorplanmaker',
              name: Routes.floorPlanMaker,
              parentNavigatorKey: navigatorKey,
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
        GoRoute(
          path: '/school/:schoolId',
          name: Routes.schoolDetail,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) {
            final params = state.params['schoolId'];
            if (params == null) throw Exception();

            final schoolId = int.parse(params);
            return MaterialPage(
              child: SchoolDetailScreen(
                schoolId: schoolId,
              ),
            );
          },
          routes: [
            GoRoute(
              path: 'floorplan',
              name: Routes.schoolFloorPlan,
              parentNavigatorKey: navigatorKey,
              pageBuilder: (context, state) {
                final arg = state.extra as SchoolDetailFloorPlanNavArg?;

                if (arg == null) throw Exception();
                return MaterialPage(
                  child: SchoolFloorPlanScreen(
                    arg: arg,
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/school/:schoolId/edit',
          name: Routes.editSchool,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) {
            final params = state.params['schoolId'];
            if (params == null) throw Exception();

            final schoolId = int.parse(params);
            return MaterialPage(
              child: EditSchoolScreen(schoolId: schoolId),
            );
          },
        ),
        GoRoute(
          path: '/editprofile',
          name: Routes.editProfile,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) {
            final user = state.extra as SignedIn;
            return MaterialPage(
              child: EditProfileScreen(user: user),
            );
          },
        ),
        GoRoute(
          path: '/photoviewer',
          name: Routes.photoViewer,
          parentNavigatorKey: navigatorKey,
          pageBuilder: (context, state) {
            final url = state.extra as String;
            return MaterialPage(
              child: ImageViewer(url: url),
            );
          },
        ),
      ];

  @override
  void addListener(VoidCallback listener) => routerListener = listener;

  @override
  void removeListener(VoidCallback listener) => routerListener = null;
}
