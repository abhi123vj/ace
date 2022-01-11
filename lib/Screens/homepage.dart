import 'package:ace/constants/colours.dart';
import 'package:ace/controller/acecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aceController = Get.put(AceController());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: bgblack),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const Center(
              child: RiveAnimation.asset(
                'assets/cosmos.riv',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height:    MediaQuery.of(context).padding.top +10,

                  ),
                  Text("Leader Board",
                 style: GoogleFonts.robotoMono  (
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ).shimmer(
                      duration: Duration(seconds: 4),
                      primaryColor: Vx.red100,
                      secondaryColor: Colors.white),
                  Text("- ACE 2022 -",
                      style: GoogleFonts.sourceCodePro(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.height,
                      child: Obx(() => ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: aceController.newlist.length,
                          itemBuilder: (context, index) {
                            // return ListTile(
                            //   title: Text(
                            //       '${aceController.newlist.elementAt(index)["sem"]} & ${aceController.newlist.elementAt(index)['point']} & ${aceController.newlist.elementAt(index)["rank"]}'),
                            // );
                            return InkWell(
                              onTap: (){
                                Get.toNamed("/deatils", arguments: aceController.newlist.elementAt(index)["sem"]);
                              },
                              child: Container(
                                //  constraints:  BoxConstraints(minWidth: 500, maxWidth: MediaQuery.of(context).size.height,),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: aceController.newlist
                                              .elementAt(index)["rank"] >
                                          3
                                      ? bgblack
                                      : textred,
                                  border: Border.all(
                                    color: textred,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "${aceController.newlist.elementAt(index)["rank"]}",
                                        style: TextStyle(
                                            color: aceController.newlist
                                                        .elementAt(
                                                            index)["rank"] >
                                                    3
                                                ? textred
                                                : textblack,
                                            fontSize: 25,
                                            fontWeight: aceController.newlist
                                                        .elementAt(
                                                            index)["rank"] >
                                                    3
                                                ? FontWeight.w500
                                                : FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          "${aceController.newlist.elementAt(index)["sem"]}",
                                          style: TextStyle(
                                              color: aceController.newlist
                                                          .elementAt(
                                                              index)["rank"] >
                                                      3
                                                  ? textred
                                                  : textblack,
                                              fontSize: 25,
                                              fontWeight: aceController.newlist
                                                          .elementAt(
                                                              index)["rank"] >
                                                      3
                                                  ? FontWeight.w500
                                                  : FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "${aceController.newlist.elementAt(index)["point"]}",
                                        style: TextStyle(
                                            color: aceController.newlist
                                                        .elementAt(
                                                            index)["rank"] >
                                                    3
                                                ? textred
                                                : textblack,
                                            fontSize: 25,
                                            fontWeight: aceController.newlist
                                                        .elementAt(
                                                            index)["rank"] >
                                                    3
                                                ? FontWeight.w500
                                                : FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
