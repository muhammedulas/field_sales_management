import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        const LoginScreenContent(),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    ));
  }
}

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({Key? key}) : super(key: key);

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.indigo, style: BorderStyle.solid),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      labelText: "Kullanıcı Adı"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kullanıcı Adı Zorunludur!";
                    } else {
                      return null;
                    }
                  },
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: TextFormField(
                  obscureText: true,
                  autofocus: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.indigo, style: BorderStyle.solid),
                      ),
                      labelText: "Parola"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Parola Zorunludur!";
                    } else {
                      return null;
                    }
                  },
                )),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    child: const Text(
                      "Giriş",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Provider.of<AuthService>(context, listen: false)
                            .login();
                      }
                    },
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                      onPressed: null, child: Text("Şifremi Unuttum")),
                )
              ],
            )
          ],
        ));
  }
}
