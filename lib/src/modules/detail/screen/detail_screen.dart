import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImagesSection(images: product.allImages),
            const SizedBox(height: Properties.kPaddingSmall),
          ],
        ),
      ),
    );
  }
}
