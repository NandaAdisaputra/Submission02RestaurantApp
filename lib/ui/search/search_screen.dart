import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/detail/detail_screen.dart';
import 'package:submission02/ui/list/future_builder_list_screen.dart';
import 'package:submission02/ui/search/search_controller.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import 'package:submission02/utils/resource_helper/colors.dart';
import 'package:submission02/utils/resource_helper/fonts.dart';
import '../../utils/resource_helper/sizes.dart';

var searchRestaurant = Get.put(SearchRestaurantController());

class SearchRestaurantScreen extends GetView<SearchRestaurantController> {
  const SearchRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Get.isDarkMode ? CustomColors.Jet : CustomColors.DarkOrange,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Obx(
            () => SizedBox(
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      Constants.searchTitle,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? CustomColors.White
                              : CustomColors.DarkOrange,
                          fontSize: displayWidth(context) * 0.08,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      Constants.searchRestaurantYourLikes,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? CustomColors.White
                              : CustomColors.DarkOrange,
                          fontSize: displayWidth(context) * 0.05),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    onChanged: (text) {
                      searchRestaurant.queryInp.value = text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? CustomColors.White
                              : CustomColors.DarkOrange,
                        ),
                        labelText: Constants.inputData,
                        hintText: Constants.search),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: Get.height,
                      child: Center(
                        child: Container(
                          child: searchRestaurant.queryInp != ''
                              ? FutureBuilder(
                                  future: searchRestaurant.getListRestaurant(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        itemCount: searchRestaurant
                                            .listBodyRestaurants.length,
                                        itemBuilder: (context, index) {
                                          var data = searchRestaurant
                                              .listBodyRestaurants[index];
                                          return InkWell(
                                            onTap: () {
                                              detailController.idRestaurant =
                                                  data[Constants.id];
                                              detailController
                                                  .getListRestaurant();
                                              Get.to(
                                                () => DetailRestaurantScreen(
                                                  restaurantID:
                                                      data[Constants.id],
                                                  restaurantNAME:
                                                      data[Constants.name],
                                                  restaurantCITY:
                                                      data[Constants.city],
                                                  restaurantDESCRIPTION: data[
                                                      Constants.description],
                                                  restaurantPICTUREID:
                                                      data[Constants.image],
                                                  restaurantRATING:
                                                      data[Constants.rating]
                                                          .toString(),
                                                  restaurantFood:
                                                      listRestaurants.foods,
                                                  restaurantDrink:
                                                      listRestaurants.drinks,
                                                ),
                                              );
                                            },
                                            child: Card(
                                              margin: EdgeInsets.only(
                                                  left: 12,
                                                  right: 8,
                                                  top: 4,
                                                  bottom: 12),
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? CustomColors.Jet
                                                  : CustomColors.Lavender,
                                              elevation: 8,
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              16, 12, 8, 12),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                            'https://restaurant-api.dicoding.dev/images/medium/${data[Constants.image]}',
                                                            fit: BoxFit.cover,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 80),
                                                      ),
                                                    ),
                                                  ),
                                                  AppSizes.wSizeBox15,
                                                  Container(
                                                      height: 50,
                                                      child: VerticalDivider(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? CustomColors
                                                                  .DarkOrange
                                                              : CustomColors
                                                                  .Scarlet)),
                                                  Flexible(
                                                    flex: 2,
                                                    child: Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                data[Constants
                                                                    .name],
                                                                style: TextStyle(
                                                                    color: Theme.of(context).brightness ==
                                                                            Brightness
                                                                                .dark
                                                                        ? CustomColors
                                                                            .OrangePeel
                                                                        : CustomColors
                                                                            .DarkOrange,
                                                                    fontSize: displayWidth(
                                                                            context) *
                                                                        FontSize
                                                                            .s0045,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        Constants
                                                                            .helvetica),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  color: Theme.of(context)
                                                                              .brightness ==
                                                                          Brightness
                                                                              .dark
                                                                      ? CustomColors
                                                                          .GreenRyb
                                                                      : CustomColors
                                                                          .Scarlet),
                                                              AppSizes
                                                                  .wSizeBox8,
                                                              Text(
                                                                data[Constants
                                                                    .city],
                                                                style: TextStyle(
                                                                    fontSize: displayWidth(
                                                                            context) *
                                                                        FontSize
                                                                            .s0045,
                                                                    color: Theme.of(context)
                                                                                .brightness ==
                                                                            Brightness
                                                                                .dark
                                                                        ? CustomColors
                                                                            .GreenRyb
                                                                        : CustomColors
                                                                            .Scarlet),
                                                              ),
                                                            ],
                                                          ),
                                                          AppSizes.hSizeBox15,
                                                          Row(
                                                            children: [
                                                              RatingBar.builder(
                                                                ignoreGestures:
                                                                    true,
                                                                itemSize: displayWidth(
                                                                        context) *
                                                                    FontSize
                                                                        .s005,
                                                                initialRating: data[
                                                                        Constants
                                                                            .rating]
                                                                    .toDouble(),
                                                                glowColor: Colors
                                                                    .transparent,
                                                                minRating: 1,
                                                                direction: Axis
                                                                    .horizontal,
                                                                allowHalfRating:
                                                                    true,
                                                                itemCount: 5,
                                                                itemPadding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                            _) =>
                                                                        Icon(
                                                                  Icons.star,
                                                                  color: Theme.of(context)
                                                                              .brightness ==
                                                                          Brightness
                                                                              .dark
                                                                      ? CustomColors
                                                                          .Gold
                                                                      : CustomColors
                                                                          .DarkCornflowerBlue,
                                                                ),
                                                                onRatingUpdate:
                                                                    (rating) {},
                                                              ),
                                                              AppSizes
                                                                  .wSizeBox50
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
                                        },
                                      );
                                    }
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  },
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset(JsonAssets.search),
                                      SizedBox(height: 20),
                                      Center(
                                        child: Text(
                                          Constants.noDataYet,
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize:
                                                displayWidth(context) * 0.05,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
