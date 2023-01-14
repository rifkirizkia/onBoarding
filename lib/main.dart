import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/screens/foods_detail_page.dart';

import 'routes/pages_route.dart';
import 'screens/foods_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FoodsPage(),
      getPages: PagesRoute.pages,
    );
  }
}
