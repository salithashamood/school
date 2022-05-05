import 'package:get/get.dart';
import 'package:school/controllers/filter_controller.dart';

import 'controllers/login_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<FilterController>(FilterController());
  }
}
