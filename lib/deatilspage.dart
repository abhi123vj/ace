import 'package:ace/constants/colours.dart';
import 'package:ace/controller/deatilscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsAce extends StatelessWidget {
  const DetailsAce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var semname = Get.arguments;
    final detailsController = Get.put(DetailsController(semname));

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Obx(() => Text(detailsController.totalpoints.value, style: GoogleFonts.sourceCodePro(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),)),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: textblack,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 10,
            ),
            Text(semname, style: GoogleFonts.bebasNeue(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )).shimmer(
                      duration: Duration(seconds: 4),
                      primaryColor: Vx.cyan100,
                      secondaryColor: Colors.white),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: detailsController.detaillist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 20 ,
                                      child: Image.asset("assets/icons/rank${detailsController.detaillist
                                    .elementAt(index)[0]}.png",fit: BoxFit.fitWidth,),
                                    ),
                                    Text(
                                        detailsController.detaillist
                                            .elementAt(index)[1],
                                       style: GoogleFonts.mukta(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 20,
                      color: detailsController.detaillist
                                    .elementAt(index)[0]==4?textred:textwhite,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    )),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                                detailsController.detaillist
                                    .elementAt(index)[2]
                                    .toString(),
                                  style: GoogleFonts.mukta(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 20,
                      color:  detailsController.detaillist
                                    .elementAt(index)[0]==4?textred:textwhite,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),)
                          ],
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
