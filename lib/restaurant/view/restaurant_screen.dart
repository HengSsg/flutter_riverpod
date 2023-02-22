import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List> paginateRestaurant() async {
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await Dio().get(
      '$ip/restaurant',
      options: Options(headers: {'authorization': 'Bearer $accessToken'}),
    );

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List>(
            future: paginateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              return ListView.separated(
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];

                    return RestaurantCard(
                      image: Image.network(
                        '$ip${item['thumbUrl']}',
                        fit: BoxFit.cover,
                      ),
                      name: item['name'],
                      tags: List<String>.from(item['tags']),
                      ratingsCount: item['ratingsCount'],
                      deliveryTime: item['deliveryTime'],
                      deliveryFee: item['deliveryFee'],
                      ratings: item['ratings'],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.0);
                  },
                  itemCount: snapshot.data!.length);
            },
          ),
        ),
      ),
    );
  }
}
