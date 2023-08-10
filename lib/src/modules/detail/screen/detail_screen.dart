import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/product.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Detail Screen'),
      ),
    );
  }
}
