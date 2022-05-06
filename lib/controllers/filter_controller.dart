import 'package:get/get.dart';

class FilterController extends GetxController {
  final List<String> statusList = ['Compleated', 'Draft', 'Scheduled'].obs;
  var selectList =[].obs;
  // Rx<List<String>> selectList = Rx<List<String>>([]);

  clickFilterItem(int index) {
    // if (selectList.value.contains(statusList[index])) {
    //   selectList.value.remove(statusList[index]);
    // } else {
    //   selectList.value.add(statusList[index]);
    // }
    if (selectList.contains(statusList[index])) {
      selectList.remove(statusList[index]);
    } else {
      selectList.add(statusList[index]);
    }
  }
}
