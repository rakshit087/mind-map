import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum MenuAction { logout }

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Notes"), actions: [
          PopupMenuButton<MenuAction>(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  child: Text("Logout"),
                  value: MenuAction.logout,
                )
              ];
            },
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  bool shouldLogout = await showLogoutAlert(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false);
                  }
                  break;
              }
            },
          )
        ]),
        body: const Text("Notes"));
  }
}

Future<bool> showLogoutAlert(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text("Logout"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      }).then((value) => value ?? false);
}
