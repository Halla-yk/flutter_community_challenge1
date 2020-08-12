import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_community_challenge1/screens/cart_screen.dart';
import '../provider/modal_hud.dart';
import '../services/product.dart';
import 'product_info.dart';
import '../services/json.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../services/products.dart';
class HomeScreen extends StatelessWidget {
  static const route = 'homeScreen';
  @override
  Widget build(BuildContext context) {
   // List<Product> _products = Provider.of<Products>(context).cartProducts;
   // ModalHud mh =  Provider.of<ModalHud>(context);
    JsonServices _js = JsonServices();
    return Scaffold(
        appBar: AppBar(
          title: Text('Products', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.route);
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
            )
          ],
        ),
        body:
//        ModalProgressHUD(
//          inAsyncCall: mh.isLoading,
//          child:
          Padding(
            padding: EdgeInsets.all(20),
            child: FutureBuilder<Products>(
              future: _js.loadJson(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  //mh.changeIsLoading(false);
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return item( snapshot.data.products[index],index,context);
                    },
                    itemCount: snapshot.data.products.length,
                  );
                }else{
                //  print(snapshot.data.products.length);
                //  mh.changeIsLoading(true);
                  return Center(child:Text('Loading.......'));

                }
              }
            )
          ),
     //   )
    );
  }

  Widget item(Product p,index,context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductInfoScreen.route,arguments: p);
        },
        child: Row(children: <Widget>[
          Placeholder(
            fallbackHeight: 70,
            fallbackWidth: 70,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: <Widget>[
              Text('USD ${p.price}'),SizedBox(height: 20,),
              Opacity(opacity:0.6,child: Text('product# ${index}'))
            ],
          )
        ]),
      ),
    );
  }
}
