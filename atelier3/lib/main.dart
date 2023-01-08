import 'package:atelier3/page/authentification.page.dart';
import 'package:atelier3/page/home.page.dart';
import 'package:atelier3/page/inscription.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../page/contact.dart';
import '../page/gallerie.dart';
import '../page/meteo.page.dart';
import '../page/parametres.page.dart';
import '../page/pays.page.dart';
import 'config/global.params.dart';

ThemeData theme = ThemeData.light();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await _onGetMode().then((value) {
    GlobalParams.themeActuel.setMode(value);
    runApp(MyApp());
  });
}

Future<String> _onGetMode() async {
  final snapshot = await ref.child('mode').get();
  if (snapshot.exists) {
    mode = snapshot.value.toString();
  } else {
    mode = "Jour";
  }
  print(mode);
  return (mode);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = {
    '/home': (context) => homePage(),
    '/inscription': (context) => inscriptionPage(),
    '/authentification': (context) => authentificationPage(),
    '/contact': (context) => ContactPage(),
    '/pays': (context) => Pays(),
    '/parametres': (context) => ParametresPage(),
    '/meteo': (context) => MeteoPage(),
    '/gallerie': (context) => Gallerie()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        theme: GlobalParams.themeActuel.getTheme(),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return homePage();
            } else {
              return authentificationPage();
            }
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    GlobalParams.themeActuel.addListener(() {
      setState(() {});
    });
  }
}
