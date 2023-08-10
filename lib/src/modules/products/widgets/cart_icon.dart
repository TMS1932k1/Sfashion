import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({
    super.key,
    required this.isExpanded,
  });

  final bool isExpanded;

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      constraints: BoxConstraints(
        maxWidth: !widget.isExpanded ? 50 : 0,
        minWidth: !widget.isExpanded ? 50 : 0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IconButton(
          onPressed: () {
            // Navigate to Cart Screen
          },
          icon: const FaIcon(FontAwesomeIcons.cartShopping),
          iconSize: 16,
        ),
      ),
    );
  }
}
