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
        return macos;
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
    apiKey: 'AIzaSyDkmdqUnI1QA1C5jaq__7BPZOVMhYsA-JI',
    appId: '1:433138306059:web:d5321e5e8497c704edcb0e',
    messagingSenderId: '433138306059',
    projectId: 'trush-box',
    authDomain: 'trush-box.firebaseapp.com',
    storageBucket: 'trush-box.appspot.com',
    measurementId: 'G-P53EFFSVZ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnaPrKaUpNY58xZisVzX3fn3Du359f0JI',
    appId: '1:433138306059:android:6a60ec19816d71c9edcb0e',
    messagingSenderId: '433138306059',
    projectId: 'trush-box',
    storageBucket: 'trush-box.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdP5XRdmJ9pExvw1nVBRQKLPdT4QLklYE',
    appId: '1:433138306059:ios:2444cf2c71376afeedcb0e',
    messagingSenderId: '433138306059',
    projectId: 'trush-box',
    storageBucket: 'trush-box.appspot.com',
    iosClientId: '433138306059-qvhjgcjmq2uo62r4ofe3optgju4ak8p8.apps.googleusercontent.com',
    iosBundleId: 'com.example.front',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdP5XRdmJ9pExvw1nVBRQKLPdT4QLklYE',
    appId: '1:433138306059:ios:2444cf2c71376afeedcb0e',
    messagingSenderId: '433138306059',
    projectId: 'trush-box',
    storageBucket: 'trush-box.appspot.com',
    iosClientId: '433138306059-qvhjgcjmq2uo62r4ofe3optgju4ak8p8.apps.googleusercontent.com',
    iosBundleId: 'com.example.front',
  );
}
