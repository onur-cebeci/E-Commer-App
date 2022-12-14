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
    apiKey: 'AIzaSyCs39sGBLb-lVWJ6UvEhncEN-vbOzpKsww',
    appId: '1:281163780109:web:4d4f178d8b4519e48bc544',
    messagingSenderId: '281163780109',
    projectId: 'e-commerce-4f5c1',
    authDomain: 'e-commerce-4f5c1.firebaseapp.com',
    storageBucket: 'e-commerce-4f5c1.appspot.com',
    measurementId: 'G-956VMETXCZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBg62IX6f1dZuBUtZauSYTmXeNqDxtiH7I',
    appId: '1:281163780109:android:0c686ca5e31f76ad8bc544',
    messagingSenderId: '281163780109',
    projectId: 'e-commerce-4f5c1',
    storageBucket: 'e-commerce-4f5c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEBI0SjrJVhE4o1vzjSU5ciQDOV6md2IM',
    appId: '1:281163780109:ios:84c31e442116ca0d8bc544',
    messagingSenderId: '281163780109',
    projectId: 'e-commerce-4f5c1',
    storageBucket: 'e-commerce-4f5c1.appspot.com',
    iosClientId: '281163780109-a89t7bp8i2qj4spubv8ef8v2983osl5l.apps.googleusercontent.com',
    iosBundleId: 'com.onurcebeci.eCommer',
  );
}
