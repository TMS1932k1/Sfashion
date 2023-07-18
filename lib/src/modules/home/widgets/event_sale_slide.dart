import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/event_sale.dart';
import 'package:s_fashion/src/modules/home/widgets/event_sale_item.dart';

class EventSaleSlide extends StatelessWidget {
  const EventSaleSlide({
    super.key,
    required this.events,
  });

  final List<EventSale> events;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: events.map((event) => EventSaleItem(event: event)).toList(),
      options: CarouselOptions(
        height: 230,
        autoPlay: true,
        viewportFraction: 1.0,
      ),
    );
  }
}
