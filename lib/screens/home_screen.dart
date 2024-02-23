import 'package:flutter/material.dart';
import 'package:gdg_assignment3/constants/coffee_list.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Coffee List',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: coffeeList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color.fromARGB(255, 238, 222, 201)),
                    child: ListTile(
                      title: Text(coffeeList[index].coffeeName),
                      onTap: () {
                        GoRouter.of(context)
                            .go('/details/${coffeeList[index].coffeeName}');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
