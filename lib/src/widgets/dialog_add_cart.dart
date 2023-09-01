import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/product.dart';
import 'package:s_fashion/src/modules/comon_logics/cart/cart_cubit.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/text_sale.dart';
import 'package:s_fashion/src/modules/detail/widgets/ui/sizes_bar.dart';
import 'package:s_fashion/src/utils/utils.dart';
import 'package:s_fashion/src/widgets/submit_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogAddCart extends StatefulWidget {
  const DialogAddCart({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<DialogAddCart> createState() => _DialogAddCartState();
}

class _DialogAddCartState extends State<DialogAddCart> {
  late int amount;
  late String size;

  @override
  void initState() {
    super.initState();
    setState(() {
      amount = 1;
      size = widget.product.sizes[0];
    });
  }

  void addCart() {
    BlocProvider.of<CartCubit>(context).addProduct(
      widget.product,
      amount,
      size,
    );
    Navigator.of(context).pop(true);
  }

  void setSize(int index) {
    final newSize = widget.product.sizes[index];

    if (newSize == size) {
      return;
    }

    setState(() {
      size = newSize;
    });
  }

  void plusAmount(int count) {
    amount += count;

    if (amount > 20) {
      return;
    }

    if (amount <= 0) {
      Navigator.of(context).pop(false);
      return;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Properties.kRadiusSmall),
                topLeft: Radius.circular(Properties.kRadiusSmall),
              ),
            ),
            width: double.infinity,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(Properties.kRadiusSmall),
                topLeft: Radius.circular(Properties.kRadiusSmall),
              ),
              child: FadeInImage(
                width: double.infinity,
                placeholder: const AssetImage(MyImages.imgPlaceHodler),
                image: NetworkImage(
                  Utils.getUrlImageProduct(widget.product.imageCover),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(Properties.kPaddingSmall),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.amount}:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => plusAmount(-1),
                          child: const FaIcon(
                            FontAwesomeIcons.minus,
                            size: Properties.sizeStar,
                          ),
                        ),
                        const SizedBox(width: Properties.kPaddingMedium),
                        Text(
                          amount.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                        const SizedBox(width: Properties.kPaddingMedium),
                        GestureDetector(
                          onTap: () => plusAmount(1),
                          child: const FaIcon(
                            FontAwesomeIcons.plus,
                            size: Properties.sizeStar,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Properties.kPaddingMedium),
                SizesBar(
                  sizes: widget.product.sizes,
                  currentSize: size,
                  selectedSize: setSize,
                ),
                const SizedBox(height: Properties.kPaddingLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.price}:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${Utils.convertCurrencyFormat(widget.product.price.toDouble())} x $amount',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                          maxLines: 1,
                        ),
                        TextSale(
                          price: widget.product.price.toDouble() * amount,
                          saleOff: widget.product.saleOff.toDouble(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: Properties.kPaddingSmall),
                SubmitButton(
                  title: AppLocalizations.of(context)!.add_cart,
                  onClick: addCart,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
