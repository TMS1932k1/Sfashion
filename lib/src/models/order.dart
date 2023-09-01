import 'package:s_fashion/src/models/product.dart';

class Order {
  final Product product;
  int amount;
  final String size;

  Order({
    required this.product,
    required this.amount,
    required this.size,
  });
}
