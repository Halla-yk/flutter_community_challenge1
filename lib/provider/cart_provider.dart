import 'package:flutter/cupertino.dart';
import '../services/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({@required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  @required this.imageUrl});
}

class Cart extends ChangeNotifier {
  Map<String, CartItem> _items = {}; //بستخدم ال  map علشان اربط اشيين مع بعض
  int _totalNumOFItems = 0;
  Map<String, CartItem> get items {
    return {..._items};
  }


  void addItem(String productId,String name,double price,String imageUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
              (existingCartItem) =>
              CartItem(
                  id: existingCartItem.id,
                  price: existingCartItem.price,
                  title: existingCartItem.title,
                  quantity: existingCartItem.quantity + 1,
              imageUrl: existingCartItem.imageUrl)); //199
      //change quantity
    } else {
      _items.putIfAbsent( //بتضيف key و value
          productId,
              () =>
              CartItem(
                  id: productId,
                  title: name,
                  price:price,
                  quantity: 1,
              imageUrl: imageUrl));
    }
    _totalNumOFItems+=1;
    notifyListeners();
  }


  deleteFromCart(Product product) {
    _items .remove(product.id);//بتحذف ال key  و ال value
    notifyListeners();
  }
  int get itemCount {
    return _items.length; //بترجع عدد ال product بدون ال quantity
  }
  void removeSingleItem(String itemId) {
    if (!_items.containsKey(itemId)) {
      print('not exist');
    }
    if (_items[itemId].quantity > 1) {
      _items.update(
          itemId, (existingCartItem) =>
          CartItem(id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity - 1
          ));
    }
    else{
      _items.remove(itemId);
    }
    notifyListeners();
  }
  double get totalAmount {
    var total = 0.0;
    _items.forEach((product, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
  double itemAmount(String productId){
    return _items[productId].price;
  }

  void incrementItemQuantity(String itemId){
    if (!_items.containsKey(itemId)) {
      print('not exist');
    }
    else{
      _items.update(
          itemId, (existingCartItem) =>
          CartItem(id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1
          ));
      _totalNumOFItems+=1;
      notifyListeners();
    }

  }
}