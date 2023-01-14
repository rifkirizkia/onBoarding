import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FoodsDetail extends StatelessWidget {
  FoodsDetail({super.key});
  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(args[0], fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                args[1],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              Text(args[2])
            ],
          ),
        ),
      ),
    );
  }
}
