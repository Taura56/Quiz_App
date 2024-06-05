import 'package:quiz/reusableWidget/reuse.dart';
import 'package:quiz/screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: [
                logoWidget("assets/images/Publication1.jpg"),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 30.0,
                ),
                buttonPress(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print('New Account Created');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  }).onError((error, StackTrace) {
                    print('Error ${error.toString()}');
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
