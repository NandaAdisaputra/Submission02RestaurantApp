import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/detail/detail_controller.dart';
import 'package:submission02/ui/review/add_field_review_screen.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
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
          child: ListView(children: [
            _buildStack(),
            Container(
              padding: const EdgeInsets.all(17),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$restaurantNAME',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: displayWidth(context) * FontSize.s008,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica'),
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
                              SizedBox(
                                  width:
                                      displayWidth(context) * FontSize.s0008),
                              Center(
                                child: Text(
                                  '$restaurantCITY',
                                  style: TextStyle(
                                      fontSize:
                                          displayWidth(context) * FontSize.s005,
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
                          SizedBox(
                              width: displayWidth(context) * FontSize.s0085),
                          Row(
                            children: [
                              Text(
                                double.parse("$restaurantRATING").toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        displayWidth(context) * FontSize.s005),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: Colors.redAccent,
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
                            color: Colors.black,
                            fontSize: displayWidth(context) * FontSize.s005,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: Text(Constants.menuFoods,
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: displayWidth(context) * FontSize.s005,
                                fontFamily: Constants.helvetica))),
                    SizedBox(
                      height: 80, // Card height
                      child: PageView.builder(
                        itemCount:
                            restaurantFood.isEmpty ? 0 : restaurantFood.length,
                        controller: PageController(viewportFraction: 0.8),
                        onPageChanged: (index) => restaurantFood.length,
                        itemBuilder: (context, index) {
                          var foodName = restaurantFood[index]['name'];
                          return AnimatedPadding(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                            padding: EdgeInsets.all(8),
                            child: Card(
                              elevation: 4,
                              child: Center(
                                child: Text(
                                  foodName,
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: displayWidth(context) *
                                          FontSize.s0045,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(8),
                        child: Text(Constants.menuDrinks,
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: displayWidth(context) * FontSize.s005,
                                fontFamily: Constants.helvetica))),
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: SizedBox(
                        height: 80, // Card height
                        child: PageView.builder(
                          itemCount: restaurantDrink.isEmpty
                              ? 0
                              : restaurantDrink.length,
                          controller: PageController(viewportFraction: 0.8),
                          onPageChanged: (index) => restaurantDrink.length,
                          itemBuilder: (context, index) {
                            var drinkName = restaurantDrink[index]['name'];
                            return AnimatedPadding(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn,
                              padding: EdgeInsets.all(8),
                              child: Card(
                                elevation: 4,
                                child: Center(
                                  child: Text(
                                    drinkName,
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: displayWidth(context) *
                                            FontSize.s0045,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Get.to(AddReviewFormScreen());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconAssets.addIcon,
            SizedBox(width: 8),
            Text(Constants.addReview, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.9, 0.9),
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(15)),
          child: Image.network(
            'https://restaurant-api.dicoding.dev/images/medium/$restaurantPICTUREID',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.orangeAccent,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              RatingBar.builder(
                ignoreGestures: true,
                itemSize: 30,
                initialRating: double.parse("$restaurantRATING"),
                glowColor: Colors.transparent,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (_, __) => Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {},
              ),
              Text(
                double.parse("$restaurantRATING").toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
