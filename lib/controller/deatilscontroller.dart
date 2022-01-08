import 'package:firebase_database/firebase_database.dart';
import 'package:get/state_manager.dart';

class DetailsController extends GetxController {
  Map deatilsmap = {};
  var totalpoints = "".obs;
  List detaillist = [].obs;
  DetailsController(String s) {
    fetchdatas(s);
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
        totalpoints.value = sum.toString();
        
        print(totalpoints.value);
      }
    });
  }
}
