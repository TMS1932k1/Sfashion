import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/routes/app_router.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/products/widgets/product_item.dart';
import 'package:s_fashion/src/modules/products/widgets/text_more.dart';
import 'package:s_fashion/src/modules/products/widgets/title_sesion.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
    required this.title,
    required this.products,
    this.onClick,
  });

  final String title;
  final List<Product> products;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    void onSelectProduct(Product product) {
      context.router.push(DetailRoute(product: product));
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: Properties.kPaddingMedium,
        left: Properties.kPaddingSmall,
        right: Properties.kPaddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSesion(
            title: title,
          ),
          const SizedBox(height: Properties.kPaddingSmall),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products
                  .map(
                    (product) => ProductItem(
                      key: UniqueKey(),
                      product: product,
                      onTapped: onSelectProduct,
                    ),
                  )
                  .toList(),
            ),
          ),
          TextMore(
            onClick: onClick,
          ),
        ],
      ),
    );
  }
}
