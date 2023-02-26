import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_card.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '불타는 떡볶이',
        child: CustomScrollView(
          slivers: [
            renderTop(),
            renderLabel(),
            renderProducts(),
          ],
        ));
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }

  renderProducts() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: ProductCard(),
          );
        }, childCount: 10),
      ),
    );
  }

  SliverToBoxAdapter renderTop() {
    return SliverToBoxAdapter(
      child: RestaurantCard(
        image: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
        name: '불타는 떡볶이',
        tags: ['ㄴㅇㄹㅇㄴ', 'ㄴㅁㅇㄹㄴㅇ'],
        ratingsCount: 100,
        deliveryTime: 20,
        deliveryFee: 2032,
        ratings: 4.23,
        isDetail: true,
        detail: '맛있는 떡볶이',
      ),
    );
  }
}
