import 'package:flutter/material.dart';

import 'components/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* resizeToAvoidBottomInset: false, */
        body: Column(
      children: [
        Row(children: const [
          Icon(Icons.insert_chart, size: 80),
          Text(
            "F S M",
            style: TextStyle(fontSize: 25),
          )
        ], mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 10),
        const LoginForm(),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    ));
  }
}
