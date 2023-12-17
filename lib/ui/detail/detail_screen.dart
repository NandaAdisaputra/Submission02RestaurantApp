import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:submission02/ui/detail/detail_controller.dart';
import 'package:submission02/utils/resource_helper/fonts.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';

class DetailRestaurantScreen extends GetView<DetailRestaurantController> {
  const DetailRestaurantScreen({
    Key? key,
    required this.restaurantID,
    required this.restaurantPICTUREID,
    required this.restaurantNAME,
    required this.restaurantCITY,
    required this.restaurantRATING,
    required this.restaurantDESCRIPTION,
    required this.restaurantFood,
    required this.restaurantDrink,
  }) : super(key: key);

  final String? restaurantID;
  final String? restaurantPICTUREID;
  final String? restaurantNAME;
  final String? restaurantCITY;
  final String? restaurantRATING;
  final String? restaurantDESCRIPTION;
  final List restaurantFood;
  final List restaurantDrink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: ListView(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(15)),
                  child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/medium/$restaurantPICTUREID',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '$restaurantNAME',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: displayWidth(context) * FontSize.s008,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.orange,
                                ),
                              ),
                              SizedBox(width: displayWidth(context) * FontSize.s0008),
                              Center(
                                child: Text(
                                  '$restaurantCITY',
                                  style: TextStyle(
                                      fontSize: displayWidth(context) * FontSize.s005,
                                      color: Colors.orange),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 30,
                              child: VerticalDivider(color: Colors.red)),
                          RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: displayWidth(context) * FontSize.s0045,
                            initialRating: double.parse("$restaurantRATING"),
                            glowColor: Colors.transparent,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (_, __) => Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(width: displayWidth(context) * FontSize.s0085),
                          Row(
                            children: [
                              Text(
                                '$restaurantRATING'.toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: displayWidth(context) * FontSize.s005),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: Colors.deepOrange,
                      thickness: 5,
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Center(
                      child: Text(
                        '$restaurantDESCRIPTION'.toString(),
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: displayWidth(context) * FontSize.s005,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: restaurantFood.length,
                              itemBuilder: (BuildContext context, int index) {
                                var foodName =
                                restaurantFood[index]['name'];
                                return Card(
                                  color: Colors.orange,
                                  elevation: 4,
                                  margin: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          '- ' + foodName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: displayWidth(context) * FontSize.s005,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )),
                        Expanded(
                          child: ListView.builder(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: restaurantDrink.length,
                            itemBuilder: (BuildContext context, int index) {
                              var drinkName =
                              restaurantDrink[index]['name'];
                              return Card(
                                color: Colors.deepOrange,
                                elevation: 4,
                                margin: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        '- ' + drinkName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                            displayWidth(context) * FontSize.s005,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
