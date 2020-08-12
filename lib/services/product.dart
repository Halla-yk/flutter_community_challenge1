
import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String name;
  final String image;
  final double price;

  Product(
      {@required this.id,
        @required this.image,
        @required this.name,
        @required this.price});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
        id: parsedJson['id'],
        name: parsedJson['name'],
        image: parsedJson['image'],
        price: parsedJson['price']);
  }
}
