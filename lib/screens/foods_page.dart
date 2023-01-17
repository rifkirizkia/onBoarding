import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/foods_controller.dart';
import '../routes/route_names.dart';

class FoodsPage extends GetView<FoodsController> {
  const FoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Foods"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<FoodsController>(
            builder: (controller) {
              return controller.isLoading!
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              mainAxisExtent: 150),
                      itemCount: controller.foodModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentFood = controller.foodModel[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.foodDetail, arguments: [
                              currentFood.image,
                              currentFood.name,
                              currentFood.desc
                            ]);
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.width * 0.5,
                                child: Image.network(
                                  currentFood.image!,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              ),
                              Column(
                                children: [
                                  const Spacer(),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width *
                                        0.07,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(112, 0, 0, 0)),
                                    child: Center(
                                      child: Text(
                                        currentFood.name!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      });
            },
          )),
    );
  }
}
