import 'package:ace/deatilspage.dart';
import 'package:ace/homepage.dart';
import 'package:ace/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
void main() async  {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       getPages: [
    GetPage(name: '/', page: () => SplashView()),
    GetPage(name: '/home', page: () => HomePage()),

    GetPage(name: '/deatils', page: () => DetailsAce()),

  ],
    );
  }
}
