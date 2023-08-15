import 'package:flutter/material.dart';
import 'package:s_fashion/src/modules/detail/widgets/detail_body/size_item.dart';

class SizesBar extends StatelessWidget {
  const SizesBar({
    super.key,
    required this.sizes,
    this.selectedSize,
  });

  final List<String> sizes;
  final Function(String)? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Sizes:',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        Row(
          children: sizes
              .map(
                (size) => SizeItem(
                  size: size,
                  onTap:
                      selectedSize != null ? () => selectedSize!(size) : null,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
