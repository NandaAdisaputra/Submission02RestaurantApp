import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:submission02/data/const/constants.dart';
import 'package:submission02/ui/detail/detail_screen.dart';
import 'package:submission02/ui/list/future_builder_list_screen.dart';
import 'package:submission02/ui/search/search_controller.dart';
import 'package:submission02/utils/resource_helper/assets.dart';
import '../../utils/resource_helper/sizes.dart';

var searchRestaurant = Get.put(SearchRestaurantController());

class SearchRestaurantScreen extends GetView<SearchRestaurantController> {
  const SearchRestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: Container(
        color: Colors.orangeAccent.shade100,
        child: SafeArea(
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
                            color: Colors.deepOrange,
                            fontSize: displayWidth(context) * 0.08,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        Constants.searchRestaurantYourLikes,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: displayWidth(context) * 0.05,
                            fontWeight: FontWeight.bold),
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
                            color: Colors.deepOrange,
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
                                                    restaurantID: data[Constants.id],
                                                    restaurantNAME:
                                                        data[Constants.name],
                                                    restaurantCITY:
                                                        data[Constants.city],
                                                    restaurantDESCRIPTION:
                                                        data[Constants.description],
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
                                                color: Colors.white60,
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
                                                            'https://restaurant-api.dicoding.dev/images/medium/${data['pictureId']}',
                                                            fit: BoxFit.cover,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 80),
                                                      ),
                                                    )),
                                                    const SizedBox(width: 15),
                                                    Flexible(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              data[Constants.name],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .deepOrange,
                                                                  fontSize:
                                                                      displayWidth(
                                                                              context) *
                                                                          0.05,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                  Constants.helvetica),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .location_on_outlined,
                                                                    color: Colors
                                                                        .grey,
                                                                    size: 16),
                                                                Text(
                                                                  data[Constants.city],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          displayWidth(context) *
                                                                              0.04,
                                                                      color: Colors
                                                                          .orange),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Row(
                                                              children: [
                                                                RatingBar
                                                                    .builder(
                                                                  ignoreGestures:
                                                                      true,
                                                                  itemSize:
                                                                      displayWidth(
                                                                              context) *
                                                                          0.05,
                                                                  initialRating:
                                                                      data[Constants.rating]
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
                                                                    color: Colors
                                                                        .blue,
                                                                  ),
                                                                  onRatingUpdate:
                                                                      (rating) {},
                                                                ),
                                                                SizedBox(
                                                                    width: 30),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      data[Constants.rating]
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            )
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
