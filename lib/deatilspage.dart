import 'package:ace/constants/colours.dart';
import 'package:ace/controller/deatilscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        label: Obx(() => Text(detailsController.totalpoints.value)),
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
            Text(semname, style: TextStyle(color: textred, fontSize: 50)),
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
                            Text(
                                detailsController.detaillist
                                    .elementAt(index)[1],
                                style:
                                    TextStyle(color: textwhite, fontSize: 25)),
                            Text(
                                detailsController.detaillist
                                    .elementAt(index)[2]
                                    .toString(),
                                style:
                                    TextStyle(color: textwhite, fontSize: 25)),
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
