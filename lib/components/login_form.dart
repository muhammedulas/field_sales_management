import 'package:field_sales_management/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextButton(
                      onPressed: () {
                        const AlertDialog();
                      },
                      child: const Text("Şifremi Unuttum")),
                )
              ],
            )
          ],
        ));
  }
}
