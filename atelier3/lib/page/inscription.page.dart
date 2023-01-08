import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class inscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;

  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Page Inscription")),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_login,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Utilisateur",
                    border:
                        OutlineInputBorder(borderSide: const BorderSide(width: 1), borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: txt_password,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Mot de passe",
                    border:
                        OutlineInputBorder(borderSide: const BorderSide(width: 1), borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  _onInscrire(context);
                },
                child: const Text(
                  'inscription',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            TextButton(
              child: const Text("j'ai déja un compte", style: TextStyle(fontSize: 22)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/authentification');
              },
            )
          ],
        ));
  }

  Future<void> _onInscrire(BuildContext context) async {
    if (txt_login.text.isNotEmpty && txt_password.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: txt_login.text.trim(), password: txt_password.text.trim());
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        SnackBar snackBar = const SnackBar(content: Text(""));
        if (e.code == 'weak-password') {
          snackBar = const SnackBar(
            content: Text('Mot de passe faible'),
          );
        } else if (e.code == 'email-already-in-use') {
          snackBar = const SnackBar(
            content: Text('Email déja existant'),
          );
        }
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(
        content: Text('id ou mot de passe vide'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
