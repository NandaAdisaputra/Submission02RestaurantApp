import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:submission02/ui/detail/detail_controller.dart';
import 'package:submission02/ui/detail/detail_screen.dart';
import 'package:submission02/ui/list/list_restaurant_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';

var listRestaurants = Get.put(ListRestaurantController());
var detailController = Get.put(DetailRestaurantController());

class FutureBuilderRestaurant extends GetView<ListRestaurantController> {
  const FutureBuilderRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: FutureBuilder(
        future: listRestaurants.getListRestaurant(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: listRestaurants.listBodyRestaurants.length,
            itemBuilder: (context, index) {
              var data = listRestaurants.listBodyRestaurants[index];

              var listFoods =
                  detailController.listBodyRestaurantsMenusFoods.map((e) {
                return e;
              }).toList();
              listRestaurants.foods = listFoods;

              var listDrinks =
                  detailController.listBodyRestaurantsMenusDrinks.map(
                (e) {
                  return e;
                },
              ).toList();
              listRestaurants.drinks = listDrinks;
              if (snapshot.hasData) {
                return InkWell(
                  onTap: () {
                    detailController.idRestaurant = data['id'];
                    detailController.getListRestaurant();
                    Get.to(
                      () => DetailRestaurantScreen(
                        restaurantID: data['id'],
                        restaurantNAME: data['name'],
                        restaurantCITY: data['city'],
                        restaurantDESCRIPTION: data['description'],
                        restaurantPICTUREID: data['pictureId'],
                        restaurantRATING: data['rating'].toString(),
                        restaurantFood: listFoods,
                        restaurantDrink: listDrinks,
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 12, right: 8, top: 4, bottom: 12),
                    color: Colors.white60,
                    elevation: 8,
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16, 12, 8, 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  'https://restaurant-api.dicoding.dev/images/medium/${data['pictureId']}',
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 80),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize:
                                              displayWidth(context) * 0.05,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Helvetica'),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      data['city'],
                                      style: TextStyle(
                                          fontSize:
                                              displayWidth(context) * 0.04,
                                          color: Colors.orange),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      ignoreGestures: true,
                                      itemSize: displayWidth(context) * 0.05,
                                      initialRating: data['rating'].toDouble(),
                                      glowColor: Colors.transparent,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    SizedBox(width: 50),
                                    Row(
                                      children: [
                                        Text(
                                          data['rating'].toString(),
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        },
      ),
    );
  }
}
