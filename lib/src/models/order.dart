import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/product.dart';

class Order extends ChangeNotifier {
  final Product product;
  int amount;
  final String size;

  Order({
    required this.product,
    required this.amount,
    required this.size,
  });

  double getSumPrice() {
    return (product.price * amount * (100 - product.saleOff) / 100).toDouble();
  }

  void increaseAmount() {
    if (amount <= 19) {
      amount += 1;
      notifyListeners();
    }
  }

  void descreaseAmount() {
    if (amount > 1) {
      amount -= 1;
      notifyListeners();
    }
  }
}
