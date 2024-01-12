// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCujswOeISLlhKyWCw-xlMn-ULoGe5Rfmw',
    appId: '1:715870857793:web:f4163edb63095b9478f4c0',
    messagingSenderId: '715870857793',
    projectId: 'sound-ito',
    authDomain: 'sound-ito.firebaseapp.com',
    storageBucket: 'sound-ito.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAB0431sfcxWmNm6_fakyO4kphlGBiHCww',
    appId: '1:715870857793:android:fcf1436b48e15ec878f4c0',
    messagingSenderId: '715870857793',
    projectId: 'sound-ito',
    storageBucket: 'sound-ito.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCz69dFBxQ4mx-TXiFFbSqSnUdAEvVONfw',
    appId: '1:715870857793:ios:b1ad229d7c5d15b478f4c0',
    messagingSenderId: '715870857793',
    projectId: 'sound-ito',
    storageBucket: 'sound-ito.appspot.com',
    iosBundleId: 'com.example.soundIto',
  );
}