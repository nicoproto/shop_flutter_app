import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, String, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        quantity: existingCartItem.quantity++,
        price: existingCartItem.price,
      ));
    } else {
      _items.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        quantity: 1,
      ));
    }
  }
}