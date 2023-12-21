import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/detail/detail_controller.dart';
import 'package:submission02/ui/detail/detail_screen.dart';
import 'package:submission02/ui/list/list_restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission02/utils/resource_helper/fonts.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';

import '../../utils/resource_helper/colors.dart';

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
              print("Datanya: $data");
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
              print("list Food: $listFoods");
              listRestaurants.drinks = listDrinks;
              print("list Drink: $listDrinks");
              if (snapshot.hasData) {
                return InkWell(
                  onTap: () {
                    detailController.idRestaurant = data[Constants.id];
                    detailController.getListRestaurant();
                    Get.to(
                      () => DetailRestaurantScreen(
                        restaurantID: data[Constants.id],
                        restaurantNAME: data[Constants.name],
                        restaurantCITY: data[Constants.city],
                        restaurantDESCRIPTION: data[Constants.description],
                        restaurantPICTUREID: data[Constants.image],
                        restaurantRATING: data[Constants.rating].toString(),
                        restaurantFood: listFoods,
                        restaurantDrink: listDrinks,
                      ),
                    );
                  },
                  child: Card(
                    margin:
                        EdgeInsets.only(left: 12, right: 8, top: 4, bottom: 12),
                    color: Get.isDarkMode
                        ? CustomColors.Jet
                        : CustomColors.Lavender,
                    elevation: 8,
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16, 12, 8, 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  'https://restaurant-api.dicoding.dev/images/medium/${data[Constants.image]}',
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 80),
                            ),
                          ),
                        ),
                        AppSizes.wSizeBox15,
                        Container(
                            height: 50,
                            child: VerticalDivider(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? CustomColors.DarkOrange
                                    : CustomColors.Scarlet)),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      data[Constants.name],
                                      style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? CustomColors.OrangePeel
                                              : CustomColors.DarkOrange,
                                          fontSize: displayWidth(context) *
                                              FontSize.s0045,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: Constants.helvetica),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? CustomColors.GreenRyb
                                            : CustomColors.Scarlet),
                                    AppSizes.wSizeBox8,
                                    Text(
                                      data[Constants.city],
                                      style: TextStyle(
                                          fontSize: displayWidth(context) *
                                              FontSize.s0045,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? CustomColors.GreenRyb
                                              : CustomColors.Scarlet),
                                    ),
                                  ],
                                ),
                                AppSizes.hSizeBox15,
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      ignoreGestures: true,
                                      itemSize:
                                          displayWidth(context) * FontSize.s005,
                                      initialRating:
                                          data[Constants.rating].toDouble(),
                                      glowColor: Colors.transparent,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? CustomColors.Gold
                                              : CustomColors
                                                  .DarkCornflowerBlue),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    AppSizes.wSizeBox50
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
                return const CircularProgressIndicator(
                  value: 0.3,
                  strokeWidth: 0.008,
                  color: Colors.greenAccent,
                  backgroundColor: Colors.grey,
                );
              }
            },
          );
        },
      ),
    );
  }
}
