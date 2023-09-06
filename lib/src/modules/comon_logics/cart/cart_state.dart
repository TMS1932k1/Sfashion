import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/order.dart';

class CartState extends Equatable {
  final List<Order> orders;

  const CartState({required this.orders});

  @override
  List<Object?> get props => [orders, UniqueKey()];
}
