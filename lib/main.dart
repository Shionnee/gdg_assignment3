import 'package:flutter/material.dart';
import 'package:gdg_assignment3/auth/user_auth.dart';
import 'package:gdg_assignment3/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserAuth(),
      child: MaterialApp.router(
        routerConfig: router,
        title: "Coffee Shop",
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
