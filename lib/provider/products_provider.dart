import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../services/product.dart';

class Products extends ChangeNotifier{

  List<Product> cartProducts = [
    Product(
        id: 'p1',
        name: 'shirt',

        price: 80.78,
        image:
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg'),
    Product(
        id: 'p2',
        name: 'pants',

        price: 78.64,
        image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg'),
    Product(
        id: 'p3',
        name: 'scarf',

        price: 90.84,
        image:
        'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
    Product(
        id: 'p4',
        name: 'pan',

        price: 54.98,
        image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg'),
    Product(
        id: 'p5',
        name: 'ABC',

        price: 67.87,
        image:
        'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
    Product(
        id: 'p6',
        name: 'DEF',

        price: 43.32,
        image:
        'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
  ];

}