import 'package:flutter/cupertino.dart';

class Category {
  String? slug;
  String? name;
  Color? color;
  String? banner;

  Category({this.slug, this.name, this.color, this.banner});

  Category.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    color = json["color"];
    banner = json["banner"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['color'] = this.color;
    data['banner'] = this.banner;
    return data;
  }
}
