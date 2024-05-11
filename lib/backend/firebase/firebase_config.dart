import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBn1UjafgeA5TFxpfwB2HGUy24TCCWZjMk",
            authDomain: "app-pelicula-y08zvh.firebaseapp.com",
            projectId: "app-pelicula-y08zvh",
            storageBucket: "app-pelicula-y08zvh.appspot.com",
            messagingSenderId: "222271786182",
            appId: "1:222271786182:web:2172999b1a52698b829bc7"));
  } else {
    await Firebase.initializeApp();
  }
}
