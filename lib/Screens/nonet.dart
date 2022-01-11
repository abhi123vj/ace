import 'package:ace/controller/acecontroller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:velocity_x/velocity_x.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aceController = Get.put(AceController());

    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          const Center(
            child: RiveAnimation.asset(
              'assets/sol.riv',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20,bottom:MediaQuery.of(context).padding.bottom + 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No Internet Connection",
                  style: GoogleFonts.robotoMono(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ).shimmer(
                    duration: Duration(seconds: 4),
                    primaryColor: Vx.yellow100,
                    secondaryColor: Colors.white),
                ElevatedButton(
                    onPressed: () {
                      if (aceController.source.keys.toList()[0] !=
                          ConnectivityResult.none) {
                        Get.offAndToNamed("/home");
                      } else {
                        Get.snackbar("No Network", "Ceck your connection");
                      }
                    },
                    child: Text("Try Again"))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
