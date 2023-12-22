import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/detail/detail_controller.dart';
import 'package:submission02/ui/list/future_builder_list_screen.dart';
import 'package:submission02/ui/review/add_field_review_screen.dart';
import 'package:submission02/utils/resource_helper/colors.dart';
import 'package:submission02/utils/resource_helper/fonts.dart';
import 'package:submission02/utils/resource_helper/sizes.dart';
import 'package:submission02/utils/widget/custom_button.dart';

class DetailRestaurantScreen extends GetView<DetailRestaurantController> {
  DetailRestaurantScreen({
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
  final reviewController = detailController.reviewController;

  final String? restaurantID;
  final String? restaurantPICTUREID;
  final String? restaurantNAME;
  final String? restaurantCITY;
  final String? restaurantRATING;
  final String? restaurantDESCRIPTION;
  final List restaurantFood;
  final List restaurantDrink;
  var _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        child: SizedBox(
          height: Get.height,
          child: ListView(children: [
            _buildStack(context),
            Container(
              padding: const EdgeInsets.all(17),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$restaurantNAME',
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? CustomColors.Pear
                              : CustomColors.DarkOrange,
                          fontSize: displayWidth(context) * FontSize.s008,
                          fontWeight: FontWeight.bold,
                          fontFamily: Constants.helvetica),
                    ),
                    AppSizes.hSizeBox15,
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
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? CustomColors.DarkOrange
                                      : CustomColors.GreenRyb,
                                ),
                              ),
                              AppSizes.wSizeBox10,
                              Center(
                                child: Text(
                                  '$restaurantCITY',
                                  style: TextStyle(
                                    fontSize:
                                        displayWidth(context) * FontSize.s005,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? CustomColors.DarkOrange
                                        : CustomColors.GreenRyb,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                              height: 30,
                              child: VerticalDivider(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? CustomColors.GreenRyb
                                      : Colors.orange)),
                          Center(
                            child: Text(
                              Constants.ratingDetail,
                              style: TextStyle(
                                  fontSize:
                                      displayWidth(context) * FontSize.s005,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? CustomColors.OrangePeel
                                      : CustomColors.DarkOrange),
                            ),
                          ),
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
                            itemBuilder: (_, __) => Icon(Icons.star,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? CustomColors.Gold
                                    : CustomColors.Gold),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                    ),
                    AppSizes.hSizeBox15,
                    CustomElevatedBtn(
                        height: 29.5,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? CustomColors.Scarlet
                                : CustomColors.RoyalBlueDark,
                        radius: 4.5,
                        onPressed: () {
                          Get.to(
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AddReviewFormScreen(
                                      restaurantID: restaurantID)),
                            ),
                          );
                        },
                        child: Text(
                          Constants.addReviewRestaurant,
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? CustomColors.GreenRyb
                                  : CustomColors.White),
                        )),
                    Divider(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? CustomColors.UsafaBlue
                          : CustomColors.SpanishViridian,
                      thickness: 5,
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: Center(
                        child: Text(
                          '$restaurantDESCRIPTION'.toString(),
                          textAlign: TextAlign.justify,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? CustomColors.White
                                  : CustomColors.Black,
                              fontSize: displayWidth(context) * FontSize.s005,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            height: 30,
                            child: VerticalDivider(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? CustomColors.DarkOrange
                                    : CustomColors.Scarlet)),
                        Container(
                            margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Text(Constants.menuFoods,
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? CustomColors.DarkOrange
                                        : CustomColors.Scarlet,
                                    fontSize:
                                        displayWidth(context) * FontSize.s005,
                                    fontFamily: Constants.helvetica))),
                      ],
                    ),
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
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? CustomColors.AppleGreen
                                          : CustomColors.DarkOrange,
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
                    Row(
                      children: [
                        Container(
                            height: 30,
                            child: VerticalDivider(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? CustomColors.DarkOrange
                                    : CustomColors.Scarlet)),
                        Container(
                            margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Text(Constants.menuDrinks,
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? CustomColors.DarkOrange
                                        : CustomColors.Scarlet,
                                    fontSize:
                                        displayWidth(context) * FontSize.s005,
                                    fontFamily: Constants.helvetica))),
                      ],
                    ),
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
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? CustomColors.AppleGreen
                                            : CustomColors.DarkOrange,
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
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildStack(context) {
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
                color: Colors.blue,
                spreadRadius: 3,
                blurRadius: 50,
                offset: const Offset(
                  5.0,
                  5.0,
                ), // changes position of shadow
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
                  color: CustomColors.Gold,
                ),
                onRatingUpdate: (rating) {},
              ),
              Container(
                margin: EdgeInsets.only(left: 125, right: 4),
                child: Text(
                  double.parse("$restaurantRATING").toString(),
                  style: TextStyle(
                      color: CustomColors.White,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _handleRefresh() async {
    _refreshIndicatorKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
  }
}