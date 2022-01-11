import 'dart:async';
import 'package:ace/controller/acecontroller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final aceController = Get.put(AceController());

  @override
  Widget build(BuildContext context) {
    print("this is ${aceController.source.keys.toList()[0]}");
    aceController.source.keys.toList()[0] != ConnectivityResult.none
        ? Timer(const Duration(seconds: 1), () => Get.offAndToNamed("/home"))
        : Timer(const Duration(seconds: 1), () => Get.offAndToNamed("/nonet"));
    ;
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
