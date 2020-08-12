import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_community_challenge1/provider/cart_provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_community_challenge1/screens/cart_screen.dart';
import '../services/product.dart';
import '../widgets/custom_button.dart';
class ProductInfoScreen extends StatelessWidget {
  static const route = 'productInfoScreen';

  @override
  Widget build(BuildContext context) {
    Product _product = ModalRoute.of(context).settings.arguments;
    Cart _cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  Opacity(opacity: 0.6, child: Text('USD${_product.price}'))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Placeholder(
                    fallbackHeight: MediaQuery.of(context).size.height * 0.35,
                    fallbackWidth: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 30,
                    child: Text(_product.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 100,
                      child: SingleChildScrollView(
                        child: Text(
                            'or lipsum as it is sometimes known, is dumm'
                                'y text used in laying out print, graphic or web designs.'
                                ' The passage is attributed to an unknown typesetter in the 15'
                                'th century who is thought to have scrambled part'
                                's of Ciceros De Finibus Bonorum et Malorum for use in a type specimen book.'
                                ' The passage is attributed to an unknown typesetter in the 15'
                                'th century who is thought to have scrambled part'
                                's of Ciceros De Finibus Bonorum et Malorum for use in a type specimen book'),
                      ))
                ],
              ),

            ],
          ),
        ),bottomNavigationBar: CustomButton(child: Text('ADD TO CART',style: TextStyle(color: Colors.white)),onPressed: (){
         _cart.addItem(_product.id, _product.name, _product.price,
              _product.image);
    },),);
  }
}
