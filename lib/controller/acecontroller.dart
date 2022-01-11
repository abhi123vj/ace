import 'package:ace/connection/connect.dart';
import 'package:ace/model/scoremodel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:collection';

class AceController extends GetxController {
  Map source = {ConnectivityResult.none: false}.obs;
  final MyConnectivity _connectivity = MyConnectivity.instance;
  Map displaymap = {};
  List newlist = [].obs;
  changemsg() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("ace2022/scores");
    //Stream<DatabaseEvent> stream = ref.onValue;
    // stream.listen((DatabaseEvent event) {
    //displaymsg.value = event.snapshot.value.;
    //    displaymap.value =  json.decode(event.snapshot.value.toString());
    // });
    // print("displaymap");

    Stream<DatabaseEvent> stream = ref.onValue;
    stream.listen((DatabaseEvent event) {
      displaymap = event.snapshot.value as Map;
      final sorted = SplayTreeMap<String, dynamic>.from(
          displaymap, (a, b) => displaymap[a] < displaymap[b] ? 1 : -1);
      newlist.clear();
      int rank = 1;
      int? prvscr;
      sorted.forEach((k, v) {
        if (prvscr != null && prvscr == v) rank--;
        newlist.add({"sem": k, "point": v, "rank": rank});
        rank++;
        prvscr = v;
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      this.source = source;
      print("the cont is ${this.source}");
    });
    changemsg();
  }
}
