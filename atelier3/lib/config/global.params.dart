import 'package:flutter/material.dart';

import '../notifier/theme.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Home",
      "icon": const Icon(
        Icons.home,
        color: Colors.blue,
      ),
      "route": "/home"
    },
    {
      "title": "Meteo",
      "icon": const Icon(
        Icons.sunny_snowing,
        color: Colors.blue,
      ),
      "route": "/meteo"
    },
    {
      "title": "Gallerie",
      "icon": const Icon(
        Icons.photo,
        color: Colors.blue,
      ),
      "route": "/gallerie"
    },
    {
      "title": "Pays",
      "icon": const Icon(
        Icons.location_city,
        color: Colors.blue,
      ),
      "route": "/pays"
    },
    {
      "title": "Contact",
      "icon": const Icon(
        Icons.contact_page,
        color: Colors.blue,
      ),
      "route": "/contact"
    },
    {
      "title": "Parametres",
      "icon": const Icon(
        Icons.settings,
        color: Colors.blue,
      ),
      "route": "/parametres"
    },
    {
      "title": "Deconnexion",
      "icon": const Icon(
        Icons.logout,
        color: Colors.blue,
      ),
      "route": "/authentification"
    },
  ];
  static MonTheme themeActuel = MonTheme();
}
