import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';
import 'meteo-details-page.dart';

class MeteoPage extends StatelessWidget {
  TextEditingController txt_ville = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Page Meteo'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_ville,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_city),
                    hintText: "ville",
                    border:
                        OutlineInputBorder(borderSide: const BorderSide(width: 1), borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    _onGetMeteoDetails(context);
                  },
                  child: const Text('Chercher', style: TextStyle(fontSize: 20))),
            ),
          ],
        ));
  }

  void _onGetMeteoDetails(BuildContext context) {
    String v = txt_ville.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => MeteoDetailsPage(v)));
    txt_ville.text = "";
  }
}
