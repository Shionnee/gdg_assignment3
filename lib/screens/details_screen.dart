import 'package:flutter/material.dart';
import 'package:gdg_assignment3/auth/user_auth.dart';
import 'package:gdg_assignment3/constants/coffee_list.dart';

import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final String coffeeId;

  const DetailsScreen({super.key, required this.coffeeId});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuth>(builder: (context, userAuth, _) {
      final selectedCoffee =
          coffeeList.firstWhere((coffee) => coffee.coffeeName == coffeeId);

      return Scaffold(
        appBar: AppBar(
          title: Text('$coffeeId Details'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Card(
              color: const Color.fromARGB(255, 255, 171, 60),
              elevation: 10,
              shadowColor: const Color.fromARGB(255, 43, 42, 42),
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(selectedCoffee.coffeeImageUrl),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      coffeeId,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        selectedCoffee.coffeeDescription,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
