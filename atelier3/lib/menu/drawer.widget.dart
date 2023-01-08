import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../config/global.params.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Colors.blue])),
          child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("image/60111.jpg"),
              radius: 80,
            ),
          ),
        ),
        //Parcourir les diffrents elements du menu
        ...(GlobalParams.menus as List).map((item) {
          return ListTile(
            title: Text(
              '${item['title']}',
              style: const TextStyle(fontSize: 22),
            ),
            leading: item['icon'],
            onTap: () async {
              if ('${item['title']}' != "Deconnexion") {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "${item['route']}");
              } else {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil('/authentification', (Route<dynamic> route) => false);
              }
            },
          );
        })
      ],
    ));
  }
}
