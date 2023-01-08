import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../config/global.params.dart';
import '../menu/drawer.widget.dart';

String mode = "Jour";
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();

class ParametresPage extends StatefulWidget {
  @override
  State<ParametresPage> createState() => _ParametersPageState();
}

class _ParametersPageState extends State<ParametresPage> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('parametres'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Mode',
              style: Theme.of(context).textTheme.headline3,
            ),
            Column(
              children: [
                ListTile(
                  title: const Text('jour'),
                  leading: Radio<String>(
                    value: "Jour",
                    groupValue: mode,
                    onChanged: (value) {
                      setState(() {
                        mode = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Nuit'),
                  leading: Radio<String>(
                      value: "Nuit",
                      groupValue: mode,
                      onChanged: (value) {
                        setState(() {
                          mode = value!;
                        });
                      }),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  _onSaveMode();
                },
                child: const Text(
                  'Enregistrer',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            )
          ],
        ));
  }

  _onSaveMode() async {
    GlobalParams.themeActuel.setMode(mode);
    await ref.set({"mode": mode}).then((value) {
      print("mode change");
      Navigator.pop(context);
    });
  }
}
