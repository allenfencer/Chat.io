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
    apiKey: 'AIzaSyBB17eTdY_xnY3N82YMJYDDO4OW2yEUhxQ',
    appId: '1:326805345562:web:75f9eb75c602e2fc24c8a3',
    messagingSenderId: '326805345562',
    projectId: 'chatio-5703d',
    authDomain: 'chatio-5703d.firebaseapp.com',
    storageBucket: 'chatio-5703d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5XqrY88KXoUtEpk-a-8Qw-rjLm3mHWF4',
    appId: '1:326805345562:android:9f9408fd53dbdfc524c8a3',
    messagingSenderId: '326805345562',
    projectId: 'chatio-5703d',
    storageBucket: 'chatio-5703d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcazhnNZkJzVeut9qHZRv2tpWFjO43QlY',
    appId: '1:326805345562:ios:4ec07b34f2a2658824c8a3',
    messagingSenderId: '326805345562',
    projectId: 'chatio-5703d',
    storageBucket: 'chatio-5703d.appspot.com',
    iosClientId: '326805345562-nl4idqq0qbc3i7b68cktq0d5gdkaresh.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatIo',
  );
}
