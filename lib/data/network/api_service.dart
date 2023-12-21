import 'package:dio/dio.dart';
import 'package:submission02/data/base/base_url.dart';
import 'package:submission02/data/model/review.dart';
import 'package:submission02/utils/error_helper/error_handler.dart';

class ApiServices {
  Dio dio = Dio();

  ApiServices() {
    dio = Dio(BaseOptions(baseUrl: base));
  }

  Future<List<Review>> fetchReview(String endPoint) async {
    try {
      final response = await dio.get(endPoint);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        List<Review> reviews = data.map((reviewsData) {
          return Review(
              id: reviewsData['id'],
              name: reviewsData['name'],
              review: reviewsData['review'],
              date: reviewsData['date']);
        }).toList();
        return reviews;
      } else {
        throw Exception(ErrorHandler.handle(dynamic));
      }
    } catch (e) {
      throw Exception(ErrorHandler.handle(dynamic));
    }
  }

  Future<List<Review>> createReview(
      {String? id,
        String? name,
        String? review,
        String? date}) async {
    try {
      final response = await dio.post("/review",
          data: {'id': id, 'name': name, 'review': review, "date": date});

      if (response.statusCode == 201) {
        final reviewData =
        response.data!['customerReviews']; List<dynamic>;
        final reviews = <Review>[];
        for (var review in reviewData) {
          reviews.add(
            Review(
              id: review['id'],
              name: review['name'],
              review: review['review'],
              date: review['date'],
            ),
          );
        }
        return reviews;
      } else {
        throw Exception(ErrorHandler.handle(dynamic));
      }
    } catch (e) {
      throw Exception(ErrorHandler.handle(dynamic));
    }
  }
}
