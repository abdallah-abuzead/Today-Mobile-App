import 'package:get/get.dart';
import 'package:today/controllers/language_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageController(), fenix: true);
  }
}
