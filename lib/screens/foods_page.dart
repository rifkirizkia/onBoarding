import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/controllers/foods_controller.dart';
import 'package:onboarding/models/foods_model.dart';
import '../repository/foods_api.dart';
import '../routes/route_names.dart';

class FoodsPage extends StatefulWidget {
  const FoodsPage({super.key});

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  List<FoodsModel> foodModel = [];

  @override
  void initState() {
    FoodsApi().getFoods(onDone: (data) {
      setState(() {
        print("Foods from api $data");
        foodModel = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Foods"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 150),
                itemCount: foodModel.length,
                itemBuilder: (BuildContext context, int index) {
                  final currentFood = foodModel[index];
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
                              height: MediaQuery.of(context).size.width * 0.07,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(112, 0, 0, 0)),
                              child: Center(
                                child: Text(
                                  currentFood.name!,
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
