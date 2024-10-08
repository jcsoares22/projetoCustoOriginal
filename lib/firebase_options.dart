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
    apiKey: 'AIzaSyA5UXUzcuAj8OERzihCOd-m8dxaVh4YNq8',
    appId: '1:34760782034:web:f810a1538cf7c6a29d3d0b',
    messagingSenderId: '34760782034',
    projectId: 'custo-5cd4c',
    authDomain: 'custo-5cd4c.firebaseapp.com',
    storageBucket: 'custo-5cd4c.appspot.com',
    measurementId: 'G-K3PFHX2MQR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNTQDCW8EXDe30fMGNou_TL5_bGslOpRQ',
    appId: '1:34760782034:android:580082a01ef1988f9d3d0b',
    messagingSenderId: '34760782034',
    projectId: 'custo-5cd4c',
    storageBucket: 'custo-5cd4c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEWa9FLMPF2vL6LzoLH8rbPHZamMn9O_Y',
    appId: '1:34760782034:ios:89d8b5c37dc9d4259d3d0b',
    messagingSenderId: '34760782034',
    projectId: 'custo-5cd4c',
    storageBucket: 'custo-5cd4c.appspot.com',
    iosBundleId: 'com.example.projetocusto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEWa9FLMPF2vL6LzoLH8rbPHZamMn9O_Y',
    appId: '1:34760782034:ios:89d8b5c37dc9d4259d3d0b',
    messagingSenderId: '34760782034',
    projectId: 'custo-5cd4c',
    storageBucket: 'custo-5cd4c.appspot.com',
    iosBundleId: 'com.example.projetocusto',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA5UXUzcuAj8OERzihCOd-m8dxaVh4YNq8',
    appId: '1:34760782034:web:9ff545f01d69a08f9d3d0b',
    messagingSenderId: '34760782034',
    projectId: 'custo-5cd4c',
    authDomain: 'custo-5cd4c.firebaseapp.com',
    storageBucket: 'custo-5cd4c.appspot.com',
    measurementId: 'G-S0PJY4K57Y',
  );

}