import 'package:flutter/material.dart';
import 'package:gdg_assignment3/auth/user_auth.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuth>(
      builder: (context, userAuth, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "You must login to access to see details of each coffee.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 43, 42, 42),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 238, 222, 201)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 43, 42, 42)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: userAuth.logIn,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 10),
                      Text("Log In"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 238, 222, 201)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 43, 42, 42)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: userAuth.logOut,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 10),
                      Text("Log Out"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
