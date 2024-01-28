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
    apiKey: 'AIzaSyDocXKbKfw4AftLYxceW2uqYKijFo-pE0Q',
    appId: '1:550705063834:web:de77d183e3273a57b7bc23',
    messagingSenderId: '550705063834',
    projectId: 'lab3-bd260',
    authDomain: 'lab3-bd260.firebaseapp.com',
    storageBucket: 'lab3-bd260.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdLtqZhj-wSH407eQclSIT2NLIvxDIpCY',
    appId: '1:550705063834:android:6eab86ab0779d594b7bc23',
    messagingSenderId: '550705063834',
    projectId: 'lab3-bd260',
    storageBucket: 'lab3-bd260.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNoqVhaASEtyphC_-8tcNtUqbbMSQvvEY',
    appId: '1:550705063834:ios:550e20627585f857b7bc23',
    messagingSenderId: '550705063834',
    projectId: 'lab3-bd260',
    storageBucket: 'lab3-bd260.appspot.com',
  );

}
