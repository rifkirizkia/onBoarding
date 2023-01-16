import 'package:get/get.dart';
import 'package:onboarding/routes/route_names.dart';

import '../bindings/foods_binding.dart';
import '../screens/foods_detail_page.dart';
import '../screens/foods_page.dart';

class PagesRoute {
  static final pages = [
    GetPage(
        name: RoutesName.foodPage,
        page: () => FoodsPage(),
        binding: FoodsBinding()),
    GetPage(name: RoutesName.foodDetail, page: () => FoodsDetail()),
  ];
}
