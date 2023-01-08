import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authentificationPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  authentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Page Authentification"),
        ),
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
                  _onAuthentifier(context);
                },
                child: const Text(
                  'Connexion',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            TextButton(
              child: const Text("Nouvel Utilisateur", style: TextStyle(fontSize: 22)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/inscription');
              },
            )
          ],
        ));
  }

  Future<void> _onAuthentifier(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: txt_login.text.trim(), password: txt_password.text.trim());
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      SnackBar snackBar = const SnackBar(content: Text(""));
      if (e.code == 'user-not-found') {
        snackBar = const SnackBar(
          content: Text('Utilisateur inexistant'),
        );
      } else if (e.code == 'wrong-password') {
        snackBar = const SnackBar(content: Text('Verifier votre mot de passe'));
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
