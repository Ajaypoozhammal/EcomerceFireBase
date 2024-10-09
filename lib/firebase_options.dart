// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCp2_oyK07n-5xeTRnhRv2LRbDMG4yGBA4',
    appId: '1:16364584357:web:2006a0331fd89e7f96fc4c',
    messagingSenderId: '16364584357',
    projectId: 'e-commerse-8b469',
    authDomain: 'e-commerse-8b469.firebaseapp.com',
    storageBucket: 'e-commerse-8b469.appspot.com',
    measurementId: 'G-KKLF85NCM2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdsX839RlyqSEH2DGq8J7XOd9ArBj_UM8',
    appId: '1:16364584357:android:f06d850d0c46d9bb96fc4c',
    messagingSenderId: '16364584357',
    projectId: 'e-commerse-8b469',
    storageBucket: 'e-commerse-8b469.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_Mn3PcJvF1Gb_X3jP8sriaPR6lgF5xTw',
    appId: '1:16364584357:ios:d328a447c7db674696fc4c',
    messagingSenderId: '16364584357',
    projectId: 'e-commerse-8b469',
    storageBucket: 'e-commerse-8b469.appspot.com',
    iosBundleId: 'com.example.ecommeurcefb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_Mn3PcJvF1Gb_X3jP8sriaPR6lgF5xTw',
    appId: '1:16364584357:ios:d328a447c7db674696fc4c',
    messagingSenderId: '16364584357',
    projectId: 'e-commerse-8b469',
    storageBucket: 'e-commerse-8b469.appspot.com',
    iosBundleId: 'com.example.ecommeurcefb',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCp2_oyK07n-5xeTRnhRv2LRbDMG4yGBA4',
    appId: '1:16364584357:web:cd92e67aeb3cb32796fc4c',
    messagingSenderId: '16364584357',
    projectId: 'e-commerse-8b469',
    authDomain: 'e-commerse-8b469.firebaseapp.com',
    storageBucket: 'e-commerse-8b469.appspot.com',
    measurementId: 'G-2QCED4B4FV',
  );
}