// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZJ66ttlGX4QuIA4OMWra0SOAOfiBGlEg',
    appId: '1:5061293118:android:87cb96f31cc161f5c44d6f',
    messagingSenderId: '5061293118',
    projectId: 'atelier3-a1652',
    databaseURL: 'https://atelier3-a1652-default-rtdb.firebaseio.com',
    storageBucket: 'atelier3-a1652.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAL5ebYlHSfH7UNSBtUnyeNGV9O-LaXT1I',
    appId: '1:5061293118:ios:6efe11c194121390c44d6f',
    messagingSenderId: '5061293118',
    projectId: 'atelier3-a1652',
    databaseURL: 'https://atelier3-a1652-default-rtdb.firebaseio.com',
    storageBucket: 'atelier3-a1652.appspot.com',
    iosClientId: '5061293118-mk77kg5amff7ckf3uc0ii40bb1i2g9tp.apps.googleusercontent.com',
    iosBundleId: 'com.example.atelier3',
  );
}
