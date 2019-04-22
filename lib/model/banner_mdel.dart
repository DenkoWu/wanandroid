class BannerModel {
  String desc;
  String imagePath;
  String title;
  String url;
  int id;
  int isVisible;
  int order;
  int type;

  BannerModel({this.desc, this.imagePath, this.title, this.url, this.id, this.isVisible, this.order, this.type});

  BannerModel.fromJson(Map<String, dynamic> json) {    
    this.desc = json['desc'];
    this.imagePath = json['imagePath'];
    this.title = json['title'];
    this.url = json['url'];
    this.id = json['id'];
    this.isVisible = json['isVisible'];
    this.order = json['order'];
    this.type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['imagePath'] = this.imagePath;
    data['title'] = this.title;
    data['url'] = this.url;
    data['id'] = this.id;
    data['isVisible'] = this.isVisible;
    data['order'] = this.order;
    data['type'] = this.type;
    return data;
  }

}
