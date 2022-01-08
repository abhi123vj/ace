import 'package:ace/constants/colours.dart';
import 'package:ace/controller/deatilscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/acecontroller.dart';

class DetailsAce extends StatelessWidget {
  const DetailsAce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var semname = Get.arguments;
    final aceController = Get.put(AceController());

    final detailsController =
        Get.put(DetailsController(semname ?? aceController.detailssem));

    final eventNameController = TextEditingController();
    final eventPosController = TextEditingController();
    final eventpointController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          eventNameController.clear();
          eventpointController.clear();
          eventPosController.clear();
          Get.defaultDialog(
            title: "Add Points!",
            content: Column(
              children: [
                TextField(
                  controller: eventNameController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Event Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: eventPosController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Position',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: eventpointController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Points',
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      detailsController.postdata(
                          {
                            "point": int.parse(eventpointController.text),
                            "rank": int.parse(eventPosController.text)
                          },
                          eventNameController.text,
                          semname ??
                              aceController
                                  .detailssem).whenComplete(() => Get.back());
                    },
                    child: const Text("Update"))
              ],
            ),
          );
        },
        label: const Text("Add"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
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
            Text(semname ?? aceController.detailssem,
                style: TextStyle(color: textred, fontSize: 50)),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: detailsController.detaillist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                           eventNameController.text=  detailsController.detaillist
                                      .elementAt(index)[1];
          eventpointController.text=detailsController.detaillist
                                      .elementAt(index)[2].toString();
          eventPosController.text = detailsController.detaillist
                                      .elementAt(index)[0].toString();
 Get.defaultDialog(
            title: "Update Points!",
            content: Column(
              children: [
                TextField(
                  controller: eventNameController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Event Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: eventPosController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Position',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: eventpointController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Points',
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          detailsController.postdata(
                              {
                                "point": int.parse(eventpointController.text),
                                "rank": int.parse(eventPosController.text)
                              },
                              eventNameController.text,
                              semname ??
                                  aceController
                                      .detailssem).whenComplete(() => Get.back());
                        },
                        child: const Text("Modify")),
                         ElevatedButton(
                        onPressed: () {
                          detailsController.deletedata(                    
                              eventNameController.text,
                              semname ??
                                  aceController
                                      .detailssem).whenComplete(() => Get.back());
                        },
                        child: const Text("Delete")),
                  ],
                )
              ],
            ),
          );

                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  detailsController.detaillist
                                      .elementAt(index)[1],
                                  style: TextStyle(
                                      color: textwhite, fontSize: 25)),
                              Text(
                                  detailsController.detaillist
                                      .elementAt(index)[2]
                                      .toString(),
                                  style: TextStyle(
                                      color: textwhite, fontSize: 25)),
                            ],
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
