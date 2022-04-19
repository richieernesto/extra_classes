import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> courses;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.courses,
    required this.dateTime,
  });
}

  class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  //final String authToken;
  //final String userId;

  Orders(
    //this.authToken, 
    //this.userId, 
    this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }
  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        courses: cartProducts,
      ),
    );
    notifyListeners();
  }
}