import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit/landingPage.dart'; // update if your folder name is different
import 'package:fruit/login.dart'; // your login page
import 'package:fruit/homepage.dart'; // your homepage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDqvYfYf-TOXLIskaLlgTnFu1mn2FaQ6Oo",
      authDomain: "fruitsoda-199cc.firebaseapp.com",
      projectId: "fruitsoda-199cc",
      storageBucket: "fruitsoda-199cc.firebasestorage.app",
      messagingSenderId: "738368691492",
      appId: "1:738368691492:web:f7b322940fb7d8fc14e7b1",
    ),
  );
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => WikiHomePage(),
      },
    );
  }
}
