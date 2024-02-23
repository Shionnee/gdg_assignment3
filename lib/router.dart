import 'package:flutter/material.dart';
import 'package:gdg_assignment3/auth/user_auth.dart';
import 'package:gdg_assignment3/screens/details_screen.dart';
import 'package:gdg_assignment3/screens/home_screen.dart';
import 'package:gdg_assignment3/screens/profile_screen.dart';
import 'package:gdg_assignment3/widgets/scaffold_with_navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();
//get isLoggedIn from profilescreen and pass it here

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
        // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: [
        // The route branch for the 1º Tab
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          // Add this branch routes
          // each routes with its sub routes if available e.g home/details
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              name: 'home',
              builder: (context, state) => const HomeScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'details/:coffeeId',
                  name: 'details',
                  redirect: (context, state) {
                    final userAuth = context.read<UserAuth>();

                    if (state.matchedLocation.contains('/details') &&
                        !userAuth.isLoggedIn) {
                      return '/profile';
                    } else {
                      return null;
                    }
                  },
                  builder: (context, state) => DetailsScreen(
                    coffeeId: state.pathParameters['coffeeId']!,
                  ),
                ),
              ],
            ),
          ],
        ),

        // The route branch for 2º Tab
        StatefulShellBranch(routes: <RouteBase>[
          // Add this branch routes
          // each routes with its sub routes if available e.g profile
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ])
      ],
    ),
  ],
);
