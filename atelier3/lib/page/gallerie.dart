import 'package:atelier3/page/gallerie-details.page.dart';
import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class Gallerie extends StatelessWidget {
  TextEditingController txt_gallery = TextEditingController();

  Gallerie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('gallerie'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_gallery,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.photo_library),
                    hintText: "Keyword",
                    border:
                        OutlineInputBorder(borderSide: const BorderSide(width: 1), borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  _onGetGalleryDetails(context);
                },
                child: const Text(
                  'Chercher',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ));
  }

  void _onGetGalleryDetails(BuildContext context) {
    String keyword = txt_gallery.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => GallerieDetailsPage(keyword)));
    txt_gallery.text = "";
  }
}
