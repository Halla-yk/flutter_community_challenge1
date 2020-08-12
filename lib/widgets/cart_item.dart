import 'package:flutter/material.dart';
import 'package:flutter_community_challenge1/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  CartItem _cartItem;

  CartItemWidget(this._cartItem);

  @override
  Widget build(BuildContext context) {
    Cart _cart = Provider.of<Cart>(context);
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            child: Placeholder(),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(_cartItem.title),
                Text('USD${_cartItem.price.toString()}'),
                Spacer(),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                       _cart.removeSingleItem(_cartItem.id);
                       print(_cartItem.quantity);
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                    Text(_cartItem.quantity.toString()),
                    FlatButton(
                      onPressed: () {
                        _cart.incrementItemQuantity(_cartItem.id);
                        print(_cartItem.quantity);
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
