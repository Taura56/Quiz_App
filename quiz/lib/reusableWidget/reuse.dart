import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Image logoWidget(String ImageName) {
  return Image.asset(
    ImageName,
    fit: BoxFit.fitWidth,
    width: 150.0,
    height: 150.0,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: const Color.fromARGB(255, 0, 0, 0),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 14, 0, 0),
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container buttonPress(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 30.0,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        isLogin ? 'LOGIN' : 'SING UP',
        style: const TextStyle(color: Colors.black, fontSize: 16.0),
      ),
    ),
  );
}
