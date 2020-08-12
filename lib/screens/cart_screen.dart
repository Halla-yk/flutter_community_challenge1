import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_community_challenge1/provider/cart_provider.dart';
import '../widgets/cart_item.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  static const route = 'cartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
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
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, fontSize: 20),
                ),
                Opacity(opacity: 0.6, child: Text(cart.totalAmount.toStringAsFixed(2)))
              ],
            ),
            Consumer<Cart>(
              builder: (_, cart, child) => cartItemBuilder(cart.items.values.toList()),)
          ],
        ),

      ),
      bottomNavigationBar: CustomButton(
        child: Text('ADD TO CART', style: TextStyle(color: Colors.white),),
        onPressed: () {

        },),);
  }

  Widget cartItemBuilder(List<CartItem> items) {
    if (items.length == 0) {
      return Text('CART IS EMPTY');
    }
    else {
      return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
        return CartItemWidget(items[index]);
      },
          separatorBuilder:(_,index)=> Divider(),
          itemCount: items.length);
    }
  }
}
