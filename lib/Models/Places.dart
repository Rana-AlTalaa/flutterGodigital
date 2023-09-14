class Places {
  int? id;
  String? name;
  String? discrption;
  String? imgUrl;

  Places({this.id, this.name, this.discrption, this.imgUrl});
  Places.fromMap(Map map) {
    id = map["id"];
    name = map["name"];
    discrption = map["discrption"];
    imgUrl = map["imgUrl"];
  }
}
