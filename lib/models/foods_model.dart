
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
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["image"] = image;
        _data["desc"] = desc;
        return _data;
    }
}