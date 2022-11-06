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
    apiKey: 'AIzaSyBUyfQdv1TEFjc3lN0Yj7nL60b9rldTA70',
    appId: '1:1034161024732:web:ca32130627f64699a20e19',
    messagingSenderId: '1034161024732',
    projectId: 'flutter-mini-project-60caa',
    authDomain: 'flutter-mini-project-60caa.firebaseapp.com',
    storageBucket: 'flutter-mini-project-60caa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAGtfSesT4ZL8bXvlXll4WeBMtwPyAmc0',
    appId: '1:1034161024732:android:513d558b18b3676da20e19',
    messagingSenderId: '1034161024732',
    projectId: 'flutter-mini-project-60caa',
    storageBucket: 'flutter-mini-project-60caa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjIbH1llTNdZWoAm2srhOfzddvvQdGJU8',
    appId: '1:1034161024732:ios:19aba6c85aefd912a20e19',
    messagingSenderId: '1034161024732',
    projectId: 'flutter-mini-project-60caa',
    storageBucket: 'flutter-mini-project-60caa.appspot.com',
    iosClientId: '1034161024732-hi4l9dv18sphh8q1v8gqq791vqc92vp9.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );
}
