import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodsDetail extends StatelessWidget {
  FoodsDetail({super.key});
  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  args[1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                args[2],
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
    );
  }
}
