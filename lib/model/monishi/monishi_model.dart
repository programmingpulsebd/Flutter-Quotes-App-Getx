class MonishiModel {
  String? id;
  String? name;
  String? image;
  String? createdAt;

  MonishiModel({this.id, this.name, this.image, this.createdAt});

  MonishiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
