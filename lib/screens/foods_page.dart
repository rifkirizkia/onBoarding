import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/models/foods_model.dart';
import '../controllers/foods_controller.dart';
import '../repository/foods_api.dart';
import '../routes/route_names.dart';

class FoodsPage extends StatelessWidget {
  final foodC = Get.put(FoodsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Foods"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<FoodsController>(
            initState: (_) {
              foodC.getFoodList();
            },
            builder: (_) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 150),
                  itemCount: foodC.foodModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    final currentFood = foodC.foodModel[index];
                    print("hasil foods=> $currentFood");
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
                            ),
                          ),
                          Column(
                            children: [
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.width * 0.07,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(112, 0, 0, 0)),
                                child: Center(
                                  child: Text(
                                    currentFood.name!,
                                    style: TextStyle(color: Colors.white),
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
