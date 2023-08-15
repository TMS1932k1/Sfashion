import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/description_section.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/divider_vertical.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/sizes_bar.dart';
import 'package:s_fashion/src/utils/utils.dart';
import 'package:s_fashion/src/widgets/rating_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
    required this.nameProduct,
    this.averageProduct = 0,
    this.quantityProduct = 0,
    this.soldProduct = 0,
    required this.material,
    required this.sizes,
    required this.description,
    required this.price,
    required this.saleOff,
  });

  final String nameProduct;
  final double averageProduct;
  final int quantityProduct;
  final int soldProduct;
  final String material;
  final String description;
  final List<String> sizes;
  final double price;
  final double saleOff;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Properties.kPaddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameProduct,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: Properties.kPaddingSmall),
          Row(
            children: [
              RatingSection(point: averageProduct),
              const SizedBox(width: Properties.kPaddingSmall),
              Text(
                averageProduct.toString(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ],
          ),
          const SizedBox(height: Properties.kPaddingSmall),
          Row(
            children: [
              Text(
                '${AppLocalizations.of(context)!.amount}: $quantityProduct',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              DividerVertical(
                height: 14,
                color: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              Text(
                '${AppLocalizations.of(context)!.sold}: $quantityProduct',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              DividerVertical(
                height: 14,
                color: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              Text(
                '${AppLocalizations.of(context)!.material}: $material',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: Properties.kPaddingMedium),
          SizesBar(sizes: sizes),
          const SizedBox(height: Properties.kPaddingMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Utils.convertCurrencyFormat(price * (1 - saleOff / 100)),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (saleOff > 0)
                    const SizedBox(width: Properties.kPaddingSmall),
                  if (saleOff > 0)
                    Text(
                      Utils.convertCurrencyFormat(price.toDouble()),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            decoration: TextDecoration.lineThrough,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.heart,
                  size: Properties.sizeIconButton,
                ),
              ),
            ],
          ),
          const SizedBox(height: Properties.kPaddingLarge),
          DescriptionSection(description: description),
          const SizedBox(height: Properties.kPaddingMedium),
        ],
      ),
    );
  }
}
