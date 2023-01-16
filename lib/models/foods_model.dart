class FoodsModel {
  String? name;
  String? image;
  String? desc;

  FoodsModel({this.name, this.image, this.desc});

  FoodsModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    image = json["image"];
    desc = json["desc"];
  }
}
