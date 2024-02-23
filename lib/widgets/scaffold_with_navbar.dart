import 'package:flutter/material.dart';
import 'package:gdg_assignment3/auth/user_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar(this.navigationShell, {super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 102, 60, 25),
        selectedItemColor: const Color.fromARGB(255, 238, 215, 199),
        unselectedItemColor: const Color.fromARGB(255, 212, 163, 129),
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Profile'),
        ],
        onTap: (int index) => _onTap(index, context),
      ),
    );
  }

  void _onTap(index, context) {
    final userAuth = Provider.of<UserAuth>(context, listen: false);

    if (index == 0 && !userAuth.isLoggedIn) {
      GoRouter.of(context).go('/');
    } else {
      navigationShell.goBranch(
        index,
        // A common pattern when using bottom navigation bars is to support
        // navigating to the initial location when tapping the item that is
        // already active. This example demonstrates how to support this behavior,
        // using the initialLocation parameter of goBranch.
        initialLocation: index == navigationShell.currentIndex,
      );
    }
  }
}
