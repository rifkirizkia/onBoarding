import 'package:get/get.dart';
import 'package:onboarding/controllers/foods_controller.dart';

class FoodsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FoodsController());
  }
}
