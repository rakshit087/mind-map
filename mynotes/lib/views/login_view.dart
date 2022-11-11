import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/firebase_auth_provider.dart';
import 'package:mynotes/utilities/show_error.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //Declare Variables
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    //Give Value to Variables
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter your Email",
              ),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: "Enter your Password",
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final pass = _password.text;
                  try {
                    await FirebaseAuthProvider().logIn(
                      email: email,
                      password: pass,
                    );
                    if (mounted) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        notesRoute,
                        (route) => false,
                      );
                    }
                  } on UserNotFoundAuthException {
                    await showErrorDialog(context, "User not found");
                  } on WrongPasswordAuthException {
                    await showErrorDialog(
                      context,
                      "Please enter correct password",
                    );
                  } on GenericAuthException {
                    await showErrorDialog(context, "Authentication Error");
                  }
                },
                child: const Text("Login"),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text("Not a user? SignUp!"),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    registerRoute,
                    (route) => false,
                  );
                },
              ),
            )
          ],
        ));
  }
}
