import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:s_fashion/src/constants/base_url.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/utils/utils.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          Properties.kRadiusMedium,
        ),
        child: SizedBox(
          width: 160,
          height: 285,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 170,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FadeInImage(
                      placeholder: const AssetImage(MyImages.imgPlaceHodler),
                      image: NetworkImage(
                        BaseUrl.imgProduct + product.imageCover,
                      ),
                      fit: BoxFit.cover,
                    ),
                    if (product.saleOff > 0)
                      Positioned(
                        right: Properties.kPaddingSmall,
                        top: 0,
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          width: 30,
                          height: 35,
                          alignment: Alignment.center,
                          child: Text(
                            '${product.saleOff}%',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: Properties.kPaddingSmall),
              RatingBar.builder(
                initialRating: product.ratingsQuantity.toDouble(),
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: Properties.sizeStar,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(height: Properties.kPaddingSmall),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Properties.kPaddingSmall,
                  ),
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: Properties.kPaddingSmall),
                      Row(
                        children: [
                          Text(
                            Utils.convertCurrencyFormat(
                              product.price * (1 - product.saleOff / 100),
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (product.saleOff > 0)
                            const SizedBox(width: Properties.kPaddingSmall),
                          if (product.saleOff > 0)
                            Text(
                              Utils.convertCurrencyFormat(
                                product.price.toDouble(),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
