import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';
import 'pays-details.page.dart';

class Pays extends StatelessWidget {
  TextEditingController txt_pays = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Page Pays'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_pays,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_city),
                    hintText: "pays",
                    border:
                        OutlineInputBorder(borderSide: const BorderSide(width: 1), borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    _onGetPaysDetails(context);
                  },
                  child: const Text('Chercher', style: TextStyle(fontSize: 20))),
            ),
          ],
        ));
  }

  void _onGetPaysDetails(BuildContext context) {
    String p = txt_pays.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaysDetailsPage(p)));
    txt_pays.text = "";
  }
}
