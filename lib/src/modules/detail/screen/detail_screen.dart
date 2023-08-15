import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/detail/widgets/buttons_submit/buttons_submit.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/detail_body.dart';
import 'package:s_fashion/src/modules/detail/widgets/list_image/images_section.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to Cart Screen
            },
            icon: const FaIcon(FontAwesomeIcons.cartShopping),
            iconSize: 16,
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ImagesSection(images: product.allImages),
                  const SizedBox(height: Properties.kPaddingSmall),
                  DetailBody(
                    nameProduct: product.name,
                    averageProduct: product.ratingsAverage.toDouble(),
                    quantityProduct: product.ratingsQuantity.toInt(),
                    soldProduct: product.sold.toInt(),
                    material: product.material,
                    sizes: product.sizes,
                    description: product.description,
                    price: product.price.toDouble(),
                    saleOff: product.saleOff.toDouble(),
                  ),
                ],
              ),
            ),
          ),
          const ButtonsSubmit(),
        ],
      ),
    );
  }
}
