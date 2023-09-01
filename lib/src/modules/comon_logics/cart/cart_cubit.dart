import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/models/order.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState(orders: []));

  void addProduct(Product product, int amount, String size) {
    final order = Order(product: product, amount: amount, size: size);
    final currentCart = [order, ...state.orders];
    emit(CartState(orders: currentCart));
  }

  void removeProduct(int index) {
    final currentCart = [...state.orders];
    currentCart.removeAt(index);
    emit(CartState(orders: currentCart));
  }

  void increaseAmountAtIndex(int index) {
    final currentCart = [...state.orders];
    currentCart[index].amount += 1;
    emit(CartState(orders: currentCart));
  }

  void descreaseAmountAtIndex(int index) {
    final currentCart = [...state.orders];
    currentCart[index].amount -= 1;
    emit(CartState(orders: currentCart));
  }
}
