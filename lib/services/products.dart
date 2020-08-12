import 'package:flutter/cupertino.dart';

import '../services/product.dart';

class Products {
  List<Product> products;

  Products({@required this.products});

  factory Products.fromJson(Map<String, dynamic> parsedJson) {
    return Products(products: toListOfProducts(parsedJson['products']));
  }

  static List<Product> toListOfProducts(List<dynamic> list) {
    List<Product> productList = list.map((e) => Product.fromJson(e)).toList();
  }
}
