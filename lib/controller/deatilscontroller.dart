import 'package:firebase_database/firebase_database.dart';
import 'package:get/state_manager.dart';

class DetailsController extends GetxController {
  Map deatilsmap = {};
  var totalpoints = 0.obs;
  List detaillist = [].obs;
  DetailsController(String s) {
    fetchdatas(s);
  }
  Future postdata(Map map, path, s) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("ace2022/Ptdetails/$s/$path");

    await ref.set(map);
    updatetable(s, totalpoints.value);
  }

  updatetable(s, int scr) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("ace2022/scores");
    await ref.update({
      s: scr,
    });
  }

  Future deletedata(path, s) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("ace2022/Ptdetails/$s/$path");
    if (detaillist.length == 1) {
      await ref.remove();
      detaillist.clear();
      updatetable(s, 0);
    }else{
      await ref.remove();
       updatetable(s, totalpoints.value);
    }
  }

  fetchdatas(String s) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("ace2022/Ptdetails/$s");
    Stream<DatabaseEvent> stream = ref.onValue;
    stream.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        deatilsmap = event.snapshot.value as Map;
        print(deatilsmap);
        detaillist.clear();
        int sum = 0;
        deatilsmap.forEach((key, value) {
          sum = sum + value['point'] as int;
          detaillist.add([value['rank'], key, value['point']]);
        });
        totalpoints.value = sum;

        print(totalpoints.value);
      }
    });
  }
}
