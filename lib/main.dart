import 'package:flutter/material.dart';
import 'package:flutter_community_challenge1/provider/modal_hud.dart';
import 'package:flutter_community_challenge1/screens/cart_screen.dart';
import 'package:flutter_community_challenge1/screens/home_screen.dart';
import 'package:flutter_community_challenge1/screens/product_info.dart';
import 'package:provider/provider.dart';

import './provider/cart_provider.dart';
import './provider/products_provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider<Products>(
            create:(context)=> Products(),

          ),
          ChangeNotifierProvider<Cart>(
            create:(context)=> Cart(),

          ),
          ChangeNotifierProvider<ModalHud>(
            create:(context)=> ModalHud(),

          )
        ],child: MaterialApp(
      initialRoute: HomeScreen.route,
      routes: {
        CartScreen.route: (context) => CartScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        ProductInfoScreen.route: (context) => ProductInfoScreen(),

      },
    ))
    ;
  }
}


