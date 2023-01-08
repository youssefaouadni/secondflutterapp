import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text("home page"),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Utilisateur: ${user?.email}",
                style: const TextStyle(fontSize: 22),
              ),
            ),
            Center(
              child: Wrap(
                children: [
                  InkWell(
                    child: Ink.image(
                      height: 180,
                      width: 180,
                      image: const AssetImage(
                        'image/meteo.png',
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/meteo');
                    },
                  ),
                  InkWell(
                    child: Ink.image(
                      height: 180,
                      width: 180,
                      image: const AssetImage('image/gallerie.png'),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/gallerie');
                    },
                  ),
                  InkWell(
                    child: Ink.image(height: 180, width: 180, image: const AssetImage('image/pays.png')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/pays');
                    },
                  ),
                  InkWell(
                    child: Ink.image(height: 180, width: 180, image: const AssetImage('image/contact.png')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/contact');
                    },
                  ),
                  InkWell(
                    child: Ink.image(height: 180, width: 180, image: const AssetImage('image/parametres.png')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/parametres');
                    },
                  ),
                  InkWell(
                    child: Ink.image(height: 180, width: 180, image: const AssetImage('image/deconnexion.png')),
                    onTap: () {
                      _Deconnexion(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Future<void> _Deconnexion(context) async {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/authentification', (Route<dynamic> route) => false);
  }
}
