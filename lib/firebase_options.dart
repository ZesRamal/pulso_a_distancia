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
    apiKey: 'AIzaSyBctFwKfBwkaSVfuqzYylsjMX1m0M73OZA',
    appId: '1:453567771103:web:22a663242e63bcb633546a',
    messagingSenderId: '453567771103',
    projectId: 'beatsperminute-1c757',
    authDomain: 'beatsperminute-1c757.firebaseapp.com',
    storageBucket: 'beatsperminute-1c757.appspot.com',
    measurementId: 'G-77W01XHFWW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBY3dF2SbT1EVJpRqbhgBhCKnDihzgvqcE',
    appId: '1:453567771103:android:49b7a25b10be3b2933546a',
    messagingSenderId: '453567771103',
    projectId: 'beatsperminute-1c757',
    storageBucket: 'beatsperminute-1c757.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApdSI3RJkd688CDrdnsh1LXHTk9Uz2OGw',
    appId: '1:453567771103:ios:8c729295b8e23b8633546a',
    messagingSenderId: '453567771103',
    projectId: 'beatsperminute-1c757',
    storageBucket: 'beatsperminute-1c757.appspot.com',
    iosClientId: '453567771103-pvu6vs2rlqsqhjdvsgb2cil2tns0ugiv.apps.googleusercontent.com',
    iosBundleId: 'com.example.heartAtTime',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApdSI3RJkd688CDrdnsh1LXHTk9Uz2OGw',
    appId: '1:453567771103:ios:8c729295b8e23b8633546a',
    messagingSenderId: '453567771103',
    projectId: 'beatsperminute-1c757',
    storageBucket: 'beatsperminute-1c757.appspot.com',
    iosClientId: '453567771103-pvu6vs2rlqsqhjdvsgb2cil2tns0ugiv.apps.googleusercontent.com',
    iosBundleId: 'com.example.heartAtTime',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBctFwKfBwkaSVfuqzYylsjMX1m0M73OZA',
    appId: '1:453567771103:web:4cdb92a5b3d433a533546a',
    messagingSenderId: '453567771103',
    projectId: 'beatsperminute-1c757',
    authDomain: 'beatsperminute-1c757.firebaseapp.com',
    storageBucket: 'beatsperminute-1c757.appspot.com',
    measurementId: 'G-10M49RKTL9',
  );
}
