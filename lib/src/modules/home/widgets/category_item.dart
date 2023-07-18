import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/base_url.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.onClick,
  });

  final Category category;

  final Function(Category)? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick != null ? () => onClick!(category) : null,
      child: Container(
        width: 120,
        height: 160,
        margin: const EdgeInsets.only(right: Properties.kPaddingSmall),
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Properties.kRadiusMedium),
            child: Stack(
              fit: StackFit.expand,
              children: [
                FadeInImage(
                  placeholder: const AssetImage(MyImages.imgPlaceHodler),
                  image: NetworkImage(
                    BaseUrl.imgCategoryBaseUrl + category.imageCover,
                  ),
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, MyColors.colorBlack],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(
                    bottom: Properties.kPaddingSmall,
                  ),
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
