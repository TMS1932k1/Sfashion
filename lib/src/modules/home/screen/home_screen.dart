import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/config/themes/styles.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/modules/home/logic/arrival_product/arrival_product_bloc.dart';
import 'package:s_fashion/src/modules/home/logic/arrival_product/arrival_product_event.dart';
import 'package:s_fashion/src/modules/home/logic/arrival_product/arrival_product_state.dart';
import 'package:s_fashion/src/modules/home/logic/category/category_bloc.dart';
import 'package:s_fashion/src/modules/home/logic/category/category_event.dart';
import 'package:s_fashion/src/modules/home/logic/category/category_state.dart';
import 'package:s_fashion/src/modules/home/logic/event/event_sale_bloc.dart';
import 'package:s_fashion/src/modules/home/logic/event/event_sale_event.dart';
import 'package:s_fashion/src/modules/home/logic/event/event_sale_state.dart';
import 'package:s_fashion/src/modules/home/widgets/action_bar.dart';
import 'package:s_fashion/src/modules/home/widgets/category_item.dart';
import 'package:s_fashion/src/modules/home/widgets/event_sale_slide.dart';
import 'package:s_fashion/src/modules/home/widgets/product_item.dart';
import 'package:s_fashion/src/modules/home/widgets/text_more.dart';
import 'package:s_fashion/src/modules/home/widgets/title_sesion.dart';
import 'package:s_fashion/src/widgets/loading_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EventSaleBloc>(context).add(const StartLoadEvent());
    BlocProvider.of<ArrivalProductBloc>(context)
        .add(const LoadArrivalProducEvent());
    BlocProvider.of<CategoryBloc>(context).add(const LoadCategoriesEvent());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        elevation: 0,
        title: Text(
          'SFashion',
          style: Style.styleLogo.copyWith(fontSize: 23),
        ),
        actions: const [ActionBar()],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: Properties.kPaddingSmall,
            right: Properties.kPaddingSmall,
            bottom: Properties.kPaddingSmall,
          ),
          child: Column(
            children: [
              _buildEventSaleSlide(),
              _buildCategoiesList(),
              _buildArrivalProduct(),
              _buildArrivalProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventSaleSlide() {
    return BlocBuilder<EventSaleBloc, EventSaleState>(
      builder: (context, state) {
        if (state is LoadingEventState) {
          return const LoadingPage();
        }

        // If have event sales
        if (state is LoadedEventState) {
          final events = state.reponse!.events;
          if (events!.isNotEmpty) {
            return EventSaleSlide(
              events: events,
            );
          }
        }

        // If have error or list is empty with not show event's slide
        return Container();
      },
    );
  }

  Widget _buildCategoiesList() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is LoadingCategoryState) {
          return const LoadingPage();
        }

        // If have event sales
        if (state is LoadedCategoryState) {
          final categories = state.reponse!.categories;
          if (categories!.isNotEmpty) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: Properties.kPaddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleSesion(title: AppLocalizations.of(context)!.category),
                  const SizedBox(height: Properties.kPaddingSmall),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories
                          .map(
                            (category) => CategoryItem(
                              category: category,
                              onClick: (category) {
                                // Navigate to filter products
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        }

        // If have error or list is empty with not show categories list
        return Container();
      },
    );
  }
}

Widget _buildArrivalProduct() {
  return BlocBuilder<ArrivalProductBloc, ArrivalProductState>(
    builder: (context, state) {
      if (state is LoadingArrivalProductState) {
        return const LoadingPage();
      }

      // If have arrival products
      if (state is LoadedArrivalProductState) {
        var arrivals = state.reponse!.products;
        if (arrivals!.isNotEmpty) {
          arrivals = arrivals.sublist(0, 10);
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: Properties.kPaddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSesion(
                  title: AppLocalizations.of(context)!.arrival_products,
                ),
                const SizedBox(height: Properties.kPaddingSmall),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: arrivals
                        .map(
                          (arrival) => ProductItem(
                            key: UniqueKey(),
                            product: arrival,
                          ),
                        )
                        .toList(),
                  ),
                ),
                TextMore(
                  onClick: () {},
                ),
              ],
            ),
          );
        }
      }

      // If have error or list is empty with not show arrival products
      return Container();
    },
  );
}
