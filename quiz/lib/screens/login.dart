import 'package:quiz/reusableWidget/reuse.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 30.0,
                ),
                buttonPress(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  }).onError((error, StackTrace) {
                    print('Error ${error.toString()}');
                  });
                }),
                signUpOption(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Dont have an Account?',
        style: TextStyle(color: Color.fromARGB(255, 24, 53, 240)),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignUp()));
        },
        child: const Text(
          ' Sign Up',
          style: TextStyle(color: Colors.blue),
        ),
      )
    ],
  );
}
