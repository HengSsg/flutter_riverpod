import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      child: Column(
        children: [
          RestaurantCard(
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
        ],
      ),
    );
  }
}
