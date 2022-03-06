import 'package:field_sales_management/components/app_bar.dart';
import 'package:field_sales_management/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenStare();
}

class _ResetPasswordScreenStare extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newPasswordAgain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthService>(
      create: (context) => AuthService(),
      child: Scaffold(
          appBar: globalAppbar("Parola Sıfırla", sourceContext: context),
          body: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: "Eski Parolanız"),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Bu Alan Zorunludur!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: newPassword,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: "Yeni Parola"),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Bu Alan Zorunludur!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: newPasswordAgain,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          labelText: "Yeni Parola Tekrar"),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Bu Alan Zorunludur!";
                        }
                        if (value != newPassword.text) {
                          return "Parolalar Uyuşmuyor!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          const snackBar = SnackBar(
                            content: Text("Parolanız Değiştirildi"),
                            backgroundColor: Colors.green,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text(
                        "Parolayı Değiştir",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
