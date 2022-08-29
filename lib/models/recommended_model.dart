import 'dart:convert';

class RecommendedModel {


  final String? name;
  final String? tagLine;
  final String? image;
  final List<String>? images;
  final String? description;
  final int? price;

  RecommendedModel({
    this.name,
    this.tagLine,
    this.image,
    required this.images,
    this.description,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "tagLine": tagLine,
      "image": image,
      "images": images,
      "description": description,
      "price": price
    };
  }

  factory RecommendedModel.fromMap(Map<String, dynamic> map) {
    return RecommendedModel(
      name: map['name'] ?? '',
      tagLine: map['tagLine'] ?? '',
      image: map['image'] ?? '',
      images: List<String>.from(map['images']),
      description: map['description']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecommendedModel.fromJson(String source) =>
      RecommendedModel.fromMap(json.decode(source));

}
