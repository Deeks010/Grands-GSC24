import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAa39M0PexCzm9FMLZcZFjfAr0yW7DTnvs",
            authDomain: "grands-6a5b4.firebaseapp.com",
            projectId: "grands-6a5b4",
            storageBucket: "grands-6a5b4.appspot.com",
            messagingSenderId: "85541936487",
            appId: "1:85541936487:web:ba7de02f7e88c930e563c2",
            measurementId: "G-YC23NGG6ZN"));
  } else {
    await Firebase.initializeApp();
  }
}
