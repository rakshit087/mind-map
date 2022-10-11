import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                    final userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: pass);
                    print(userCredential);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == "user-not-found") {
                      print("User not found");
                    } else if (e.code == "wrong-password") {
                      print("Please enter correct password");
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text("Login"),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text("Not a user? SignUp!"),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/register', (route) => false);
                },
              ),
            )
          ],
        ));
  }
}
