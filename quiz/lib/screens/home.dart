import 'package:flutter/material.dart';
import 'package:quiz/reusableWidget/reuse.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        logoWidget("assets/images/Publication1.jpg"),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
