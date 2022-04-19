import 'package:flutter/foundation.dart';

class CartItem{
  final String id;
  final String title;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.price
  });
}

class Cart with ChangeNotifier {
  Map <String, CartItem> _items ={};

  Map <String, CartItem> get items {
    return {..._items};
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price;
     });
     return total;
     notifyListeners();
  }

  void addItem(
    String productId,
    double price,
    String title,
  ){
    _items.putIfAbsent(productId, () => CartItem(
      id: DateTime.now().toString(),
      title: title,
      price: price,
    ));
    notifyListeners();
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }
}