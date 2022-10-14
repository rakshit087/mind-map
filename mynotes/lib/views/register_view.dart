import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/firebase_auth_provider.dart';
import 'package:mynotes/utilities/show_error.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          title: const Text("Register"),
        ),
        body: Column(children: [
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
                  await FirebaseAuthProvider().createUser(
                    email: email,
                    password: pass,
                  );
                } on WeakPasswordAuthException {
                  await showErrorDialog(context, "Weak Password Entered");
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialog(
                    context,
                    "Email is already in use please Login",
                  );
                } on InvalidEmailAuthException {
                  await showErrorDialog(context, "Invalid Email");
                }
                if (mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (route) => false,
                  );
                }
              },
              child: const Text("Sign Up"),
            ),
          ),
          Center(
            child: TextButton(
              child: const Text("Already a user? Login!"),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
            ),
          )
        ]));
  }
}
